from kubernetes import client, config

config.load_kube_config()  # for local environment
# or
# config.load_incluster_config()


v1 = client.CoreV1Api()
# print("Listing pods with their IPs:")
ret = v1.list_pod_for_all_namespaces(watch=False)

# print(ret.items[0].status.host_ip)


print((ret.items[0].metadata.owner_references[0].uid))
print(ret.items[0].metadata.uid)

