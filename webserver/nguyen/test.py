
from __future__ import print_function
import time
import kubernetes.client
from kubernetes.client.rest import ApiException
from pprint import pprint
import mysql.connector

# mydb = mysql.connector.connect(
#         host="127.0.0.1",
#         user="core",
#         password="mothaiba",
#         database="pod"

# )
# mycursor = mydb.cursor()
# cur = mydb.cursor()
# find = 'SELECT ip_pod FROM pod.Pods where namespace = "%s" ' % ('asdasdaddad12425345')
# find_name = 'SELECT name_pod FROM pod.Pods where namespace = "%s" ' % ('asdasdaddad12425345')
# # mycursor.execute(find)

# # print(mycursor.fetchall())
# # for i in mycursor.fetchall():
# #         print(i[0])

# mycursor.execute(find)
# name_list = []
# for i in mycursor.fetchall():
#         name_list.append(i[0])
# print(type(name_list[0]))
# print(name_list)
# mycursor.close()
# dict = {}
# a = 'kiemtcb/curl;nginx'
svc = {
        "kiemtcb/curl;nginx" : [1,4,5,3,6],
        "nginx;kiemtcb/doan1:server-final" : [6,7,9,4]
    }
print(list(svc.keys()))

svc_list = ["kiemtcb/curl","nginx","kiemtcb/doan1:server-final"]
ip_list = ['10.233.97.168', '10.233.75.9', '10.233.102.137']
route_dict = {}
value_count = 0
for i in list(svc.keys()):
        src, sep, dst = i.partition(';')
        # print(i)
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
                temp = {route_key : list(svc.values())[value_count]}
                route_dict.update(temp)
                value_count += 1
print(route_dict)