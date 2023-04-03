# Thực hiện các câu lệnh sau ở thư mục này để chạy SDN controller

```
source bin/activate

cd lib/python3.8/site-packages/ryu/

ryu-manager --observe-links ~/trung/mytest/Controller_IP.py ofctl_rest.py rest_topology.py
```
