from flask import Flask, render_template,request
import requests
import json
from kubernetes import client, config
from pprint import pprint
config.load_kube_config()
import time
import mysql.connector
import webserver
appsv1 = client.AppsV1Api()
corev1 = client.CoreV1Api()
ret = appsv1.list_deployment_for_all_namespaces()
app = Flask(__name__)


def pod_deployment(data,test) :
    allService = data['service']
    nodeAffinity = data['NodeAffinity']
    lengthAllService = len(allService)
    
    a = 0
    for i in allService:
        
        if i.find('/') != -1:
            name = i.replace('/','')
            if name.find(':') != -1:
                name = name.replace(':','')
        else:
            name = i 

        name_metadata_deploy = name + "-" + data['idt'] +"-deployment"

        selector_matchLabels_deploy = {"app": name + "-deployment", "ID": data['idt']}

        labels_metadata_template_deploy = {"app": name + "-deployment",  "ID": data['idt']}

        nameImageHead, nameImageSep, nameImageTail=  name.partition(':')
        Image= i
        portContainerHead, portContainerHeadSep, portContainerHeadTail = data['port'][i].partition(':')
        
        portContainerList = [client.V1ContainerPort(container_port=int(portContainerHead)),client.V1ContainerPort(container_port=int(9900))]


        # cho vong lap for kiem tra so luong trong file json de biet duoc so luong port tu do them dung so luong vao portContainerList

        # portContainerHead chi dung khi ma json chi co 1 port 80:5000
        # portContainerHead se chua du khi co >= 2 port 80:5000, 81:5001, 6000:5900
        nodeSelector_Pod = {"kubernetes.io/hostname": nodeAffinity[a]}
        
        pod_spec=client.V1PodSpec(containers=[client.V1Container(
                        image=Image,
                        name=nameImageHead,
                        ports=portContainerList)],

                        # ports la 1 list nen em co the them nhieu tham so [1,3,4,5,7,8]

                        node_selector = nodeSelector_Pod) #name="containerport" ????

        deploy_template=client.V1PodTemplateSpec(metadata=client.V1ObjectMeta(
                                labels=labels_metadata_template_deploy), #???
                                spec=pod_spec)
        
        deploy_spec=client.V1DeploymentSpec(
                                replicas=1,
                                selector=client.V1LabelSelector(match_labels=selector_matchLabels_deploy), #???? #sua lan 1
                                template=deploy_template)

        deploy=client.V1Deployment(kind="Deployment",
                                metadata=client.V1ObjectMeta(name=name_metadata_deploy),
                                spec=deploy_spec)
        a+=1 
        # deploy_result=appsv1.create_namespaced_deployment(namespace=data['idt'], body=deploy)
        # pprint(deploy_result)
        try:                         
            deploy_result=appsv1.create_namespaced_deployment(namespace=data['idt'], body=deploy)
            # a = deploy_result
            # pprint(appsv1.create_namespaced_deployment(namespace=data['idt'], body=deploy))
        except:
            # pprint(a)
            return test 
        
    test=True
    return test

# @app.route('/registSFC', methods=['POST', 'GET'] )
def service_deployment(data,test):
    allService = data['service']
    nodeAffinity = data['NodeAffinity']
    lengthAllService = len(allService)
    
    
    for i in allService:
        
        if i.find('/') != -1:
            name = i.replace('/','')
            if name.find(':') != -1:
                name = name.replace(':','')
        else:
            name = i 
        
        port_spec_head, port_spec_mid, port_spec_tail = data['port'][i].partition(':')
        name_metadata_svc = name + "-"+ data['idt'] +"-svc"
        
        port_ports_spec = port_spec_head
        target_port_port = port_spec_tail
        selector_svc = {"app": name + "-deployment", "ID": data['idt']}

        service_spec=client.V1ServiceSpec(type="ClusterIP",
                        ports=[client.V1ServicePort(target_port=int(port_ports_spec),port=int(target_port_port))],
                        selector=selector_svc)

        service=client.V1Service(
            api_version="v1",
            kind="Service",
            metadata=client.V1ObjectMeta(name=name_metadata_svc),
            spec=service_spec)
        # service_result=corev1.create_namespaced_service(namespace=data['idt'], body=service)
        # pprint(service_result)
        try:
            service_result=corev1.create_namespaced_service(namespace=data['idt'], body=service)
            # pprint(service_result)
        except:
            return test
    test = True
    return test
# can luu status vao db:
#   ? code tren file webserver
#   or ? code tren SFCweb + update thang vao cot status trong db luon 
# lay thong tin tu cot ip_pod
@app.route('/registSFC', methods=['POST', 'GET'] )
def launch():
    check_pod = False
    check_svc = False
    if request.method == 'POST':
        f = request.data
        data = json.loads(f)
        
        ret2 = corev1.list_pod_for_all_namespaces()
        
        body = client.V1Namespace(api_version="v1",
            kind="Namespace",metadata=client.V1ObjectMeta(name=str(data['idt'])))
        try:
            ns_create = corev1.create_namespace(body = body)
        except:
            print('Namespace Creation Failed')
            
        check_pod = pod_deployment(data,check_pod)
        if check_pod == False:
            return 'Unsucccessful Pods Deployment'
        check_svc = service_deployment(data,check_svc)
        if check_svc == False:
            return 'Unsuccessful Services Deployment'
        time.sleep(30)
        # time.sleep(60)
        # list_pod(ret2.items)
        # lay thong tin dia chi ip cua cac service
        # tricker lai function getUdateData -> phia ben oschrestrator em tao 1 dia chi /updatedatabase
        # getUdateData tao them 1 cot status (runing/ terminating,...., conatinercreating)
        # tim dc dia chi ip cua pod thong qua namespace=id

        # Update status vao db:
        webserver.updatedata()
        mydb = mysql.connector.connect(
            host="127.0.0.1",
            user="core",
            password="mothaiba",
            database="pod"

        )
        mycursor = mydb.cursor()
        mycursor.execute('SELECT * FROM pod.Pods')
        fetch = mycursor.fetchall()
        i = ret2.items[0]
        for i in ret2.items:
            if (i.status.phase == 'Running'):
                # pprint(i.status.container_statuses)
                if (i.status.container_statuses[0].ready == True):
                    # print("Running")
                    upt_pod = """Update Pods SET status = 'Running'"""
                    mycursor.execute(upt_pod)
                    # time.sleep(15)
                else:
                    print("CrashLoopBackOff")
                    upt_pod = """Update Pods SET status = 'CrashLoopBackOff' """
                    mycursor.execute(upt_pod)
                    # time.sleep(15)
            elif (i.status._phase == 'Pending'):
                print("Pending")
                upt_pod = """Update Pods SET status = 'Pending' """
                mycursor.execute(upt_pod)
                # time.sleep(15)
            # mycursor.execute(upt_pod)
        mydb.commit()


    # Tao File JSON:
        allService = data['service']
        find = 'SELECT ip_pod FROM pod.Pods where namespace = "%s" ' % (data['idt'])
        find_name = 'SELECT name_pod FROM pod.Pods where namespace = "%s" ' % (data['idt'])
        # Luu name_pod vao List:
        mycursor.execute(find_name)
        name_list = []
        for i in mycursor.fetchall():
            name_list.append(i[0])
        # print(name_list)
        
        # So sanh name_pod vs service + tao ip_pod list
        ip_list = []
        svc_list = []
        mycursor.execute(find)
        for i in mycursor.fetchall():
            ip_list.append(i[0])
        for k in name_list:
            for j in allService:
            
                if j.find('/') != -1:
                    name = j.replace('/','')
                    if name.find(':') != -1:
                        name = name.replace(':','')
                else:
                    name = j
                if name in k:
                    svc_list.append(j)
        # print(svc_list)
        # tao route:
        route_dict = {}
        route = data['route']
        value_count = 0
        for i in list(route.keys()):
            src, sep, dst = i.partition(';')
            j = 0
            check = 0
            for k in svc_list:
                    if dst == svc_list[j]:
                            dst = ip_list[j]
                            check += 1
                    j+=1
            j = 0
            for k in svc_list:
                    if src == svc_list[j]:
                            src = ip_list[j]
                            check += 1
                    j+=1
                    
            if check == 2:
                    seperator = ';'
                    list_key = [src, dst]
                    route_key = seperator.join(list_key)
                    temp = {route_key : list(route.values())[value_count]}
                    route_dict.update(temp)
                    value_count += 1
        print(route_dict)
        my_json = ({ 'idt':data["idt"], 'service':svc_list, 'ip_pod':ip_list, 'route':route_dict})
        create_json = json.dumps(my_json, indent=4)
        print(create_json)
        post = requests.post(url = "http://127.0.0.1:5000", data = create_json)
        print(post.text)
        mycursor.close()

        


    return 'Success'


# @app.route('/deleteSFC', methods=['POST', 'GET'] )
def delete_ns(data, test):
    namespace = data["namespace"]
    try:
        pod_del = corev1.delete_namespace(name = namespace)
    except:
        return test
    test = True
    return test
@app.route('/deleteSFC', methods=['POST', 'GET'] )
def del_launch():
    check_ns = False
    # check_svc = False
    if request.method == 'POST':
        f = request.data
        data = json.loads(f)
        check_ns = delete_ns(data, check_ns)
        if check_ns == False:
            return 'Pod Delete Failed'
    return 'Done'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5001')