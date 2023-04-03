-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pod
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Pods`
--

DROP TABLE IF EXISTS `Pods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pods` (
  `uid_owner_references` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `name_pod` varchar(255) DEFAULT NULL,
  `namespace` varchar(45) DEFAULT NULL,
  `ip_pod` varchar(45) DEFAULT NULL,
  `port_pod` json DEFAULT NULL,
  `host_ip` varchar(45) DEFAULT NULL,
  `list_labels` json DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pods`
--

LOCK TABLES `Pods` WRITE;
/*!40000 ALTER TABLE `Pods` DISABLE KEYS */;
INSERT INTO `Pods` VALUES ('16463e35-748f-4378-85ea-7ff13a4f4ee8','15b4e716-211c-4fe0-9820-4d18a13b9b18','kiemtcbcurl-asdasdaddad12425345-deployment-5d7f7cbb5c-hfkm9','asdasdaddad12425345','10.233.97.168','[80, 9900]','10.1.0.2','{\"ID\": \"asdasdaddad12425345\", \"app\": \"kiemtcbcurl-deployment\", \"pod-template-hash\": \"5d7f7cbb5c\"}','Running'),('f4af471c-6129-43df-bcca-8ad74f396d1c','9350a4ca-1ea9-46c8-a490-cbae2db81002','kiemtcbdoan1server-final-asdasdaddad12425345-deployment-857gjsm','asdasdaddad12425345','10.233.75.9','[8888, 9900]','10.1.0.4','{\"ID\": \"asdasdaddad12425345\", \"app\": \"kiemtcbdoan1server-final-deployment\", \"pod-template-hash\": \"85d5797c64\"}','Running'),('7ff29957-e37d-4f0b-8129-1d3c12daac9d','92bc3c40-bab5-4b88-823e-9767a46cf5e0','nginx-asdasdaddad12425345-deployment-585cfc6976-zffpv','asdasdaddad12425345','10.233.102.137','[80, 9900]','10.1.0.3','{\"ID\": \"asdasdaddad12425345\", \"app\": \"nginx-deployment\", \"pod-template-hash\": \"585cfc6976\"}','Running'),('fd4c55a5-25c5-48b9-a1dc-78becc271670','c6bd7b3c-1406-4125-afcd-174ad3c4d5dc','calico-node-8n75p','kube-system','10.1.0.4',NULL,'10.1.0.4','{\"k8s-app\": \"calico-node\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"7bd64fd975\"}','Running'),('fd4c55a5-25c5-48b9-a1dc-78becc271670','c36c3980-2f18-49e4-bb0e-3648b5378cf8','calico-node-dpqg8','kube-system','10.1.0.3',NULL,'10.1.0.3','{\"k8s-app\": \"calico-node\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"7bd64fd975\"}','Running'),('fd4c55a5-25c5-48b9-a1dc-78becc271670','692c1dc2-1de3-42c1-8501-6fac927035ef','calico-node-n9twg','kube-system','10.1.0.2',NULL,'10.1.0.2','{\"k8s-app\": \"calico-node\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"7bd64fd975\"}','Running'),('615233ad-21b0-487a-b095-c2c849103dbd','089e579c-3977-409a-be2e-c961854813e1','coredns-74d6c5659f-7skz7','kube-system','10.233.102.135','[53, 9153]','10.1.0.3','{\"k8s-app\": \"kube-dns\", \"pod-template-hash\": \"74d6c5659f\"}','Running'),('615233ad-21b0-487a-b095-c2c849103dbd','3dc87946-ae85-49af-a530-26a75bb07ac5','coredns-74d6c5659f-zndgg','kube-system','10.233.97.153','[53, 9153]','10.1.0.2','{\"k8s-app\": \"kube-dns\", \"pod-template-hash\": \"74d6c5659f\"}','Running'),('4a9a9fc7-bc1d-41ca-a5bf-dde40ccada22','e7c0afd9-f55d-492a-a880-703257d518a5','dns-autoscaler-59b8867c86-khlrs','kube-system','10.233.97.161',NULL,'10.1.0.2','{\"k8s-app\": \"dns-autoscaler\", \"pod-template-hash\": \"59b8867c86\"}','Running'),('b30fab62-e4b4-4449-97ce-039067b7931d','dc3e6728-15cb-4d7e-a8d8-5997e7b460b1','kube-apiserver-master','kube-system','10.1.0.2',NULL,'10.1.0.2','{\"tier\": \"control-plane\", \"component\": \"kube-apiserver\"}','Running'),('b30fab62-e4b4-4449-97ce-039067b7931d','cbc4974f-5b68-47fd-95ea-bca4fb67bf58','kube-controller-manager-master','kube-system','10.1.0.2',NULL,'10.1.0.2','{\"tier\": \"control-plane\", \"component\": \"kube-controller-manager\"}','Running'),('0cdabeff-0f29-4a95-8487-acd10c9f0329','4a2a1544-8106-4621-9cd5-f925517c1eda','kube-proxy-h67wl','kube-system','10.1.0.3',NULL,'10.1.0.3','{\"k8s-app\": \"kube-proxy\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"c6f877454\"}','Running'),('0cdabeff-0f29-4a95-8487-acd10c9f0329','cca0fe18-4f78-413a-af83-7d24649a0f80','kube-proxy-hvqcs','kube-system','10.1.0.2',NULL,'10.1.0.2','{\"k8s-app\": \"kube-proxy\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"c6f877454\"}','Running'),('0cdabeff-0f29-4a95-8487-acd10c9f0329','319f1b62-eeda-494d-9506-f91d87f62707','kube-proxy-lnsq7','kube-system','10.1.0.4',NULL,'10.1.0.4','{\"k8s-app\": \"kube-proxy\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"c6f877454\"}','Running'),('b30fab62-e4b4-4449-97ce-039067b7931d','99f4a831-d3ed-4612-9dc9-4d175881ca43','kube-scheduler-master','kube-system','10.1.0.2',NULL,'10.1.0.2','{\"tier\": \"control-plane\", \"component\": \"kube-scheduler\"}','Running'),('86824bb2-e4b8-49d0-99e2-d9a704e49fb9','2860cdfc-0e20-4a56-88bd-1279b63fb547','kube-state-metrics-798fd9557b-qh59l','kube-system','10.233.97.143','[8080, 8081]','10.1.0.2','{\"pod-template-hash\": \"798fd9557b\", \"app.kubernetes.io/name\": \"kube-state-metrics\", \"app.kubernetes.io/version\": \"2.3.0\", \"app.kubernetes.io/component\": \"exporter\"}','Running'),('f7fb5d6c-910b-426c-94b2-2ca27ab31cea','b1118eec-ee78-47ef-85f9-b9f2b7eda24b','nginx-proxy-node1','kube-system','10.1.0.3',NULL,'10.1.0.3','{\"k8s-app\": \"kube-nginx\", \"addonmanager.kubernetes.io/mode\": \"Reconcile\"}','Running'),('1222c2d9-89f2-4e19-8c4f-e5b4ab524ad2','06b1e914-d48b-4588-844f-0196b159f52d','nginx-proxy-node2','kube-system','10.1.0.4',NULL,'10.1.0.4','{\"k8s-app\": \"kube-nginx\", \"addonmanager.kubernetes.io/mode\": \"Reconcile\"}','Running'),('f66e4a63-4079-47d3-b9a2-59eb05c52112','89442b08-d4a2-4ca3-851c-9f3da42f5eed','nodelocaldns-p9frc','kube-system','10.1.0.4','[53, 9253]','10.1.0.4','{\"k8s-app\": \"nodelocaldns\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"57b56767fb\"}','Running'),('f66e4a63-4079-47d3-b9a2-59eb05c52112','98966ecd-c133-4a33-a3d3-92bef74ec845','nodelocaldns-psjwp','kube-system','10.1.0.2','[53, 9253]','10.1.0.2','{\"k8s-app\": \"nodelocaldns\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"57b56767fb\"}','Running'),('f66e4a63-4079-47d3-b9a2-59eb05c52112','3818f9cc-93e8-4f44-9714-65be833d1493','nodelocaldns-z2dw8','kube-system','10.1.0.3','[53, 9253]','10.1.0.3','{\"k8s-app\": \"nodelocaldns\", \"pod-template-generation\": \"1\", \"controller-revision-hash\": \"57b56767fb\"}','Running'),('4512f609-794f-428e-9468-9214abe5e68a','d632e180-f137-4641-9e73-fd0d0cad95d3','grafana-59b48c5bb5-lzcn4','monitoring','10.233.97.165','3000','10.1.0.2','{\"app\": \"grafana\", \"pod-template-hash\": \"59b48c5bb5\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.166','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running'),('233a5a5c-ba25-4d4f-ad1a-ecb2edf5b3c3','a2a6720b-544e-47c0-9abe-60fcd14d7d75','prometheus-deployment-f78585ddb-hh8fc','monitoring','10.233.97.135','9090','10.1.0.2','{\"app\": \"prometheus-server\", \"pod-template-hash\": \"f78585ddb\"}','Running');
/*!40000 ALTER TABLE `Pods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Route` (
  `ip_src` varchar(45) DEFAULT NULL,
  `ip_dst` varchar(45) DEFAULT NULL,
  `port_dst` varchar(45) DEFAULT NULL,
  `route` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

LOCK TABLES `Route` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
INSERT INTO `Route` VALUES ('10.233.97.155','10.233.102.188','80','3,2,1,4');
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service` (
  `uid_service` varchar(255) DEFAULT NULL,
  `name_service` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `ip_service` varchar(45) DEFAULT NULL,
  `port_service` varchar(45) DEFAULT NULL,
  `list_labels` json DEFAULT NULL,
  `selector` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES ('3e20ec3a-710d-4dfa-8d3f-18a050d442b6','headless','default','None','80','null','{\"app\": \"headless\"}'),('8a1aef8f-59c7-4539-a3d6-2165c7f0069c','kubernetes','default','10.233.0.1','443','{\"provider\": \"kubernetes\", \"component\": \"apiserver\"}','null'),('17f25e1a-b17e-4487-8f16-c8351d627544','coredns','kube-system','10.233.0.3','53','{\"k8s-app\": \"kube-dns\", \"kubernetes.io/name\": \"coredns\", \"addonmanager.kubernetes.io/mode\": \"Reconcile\"}','{\"k8s-app\": \"kube-dns\"}'),('f6fe689f-11e6-4251-a29e-c9edb438e285','nginx-svc','test','10.233.13.149','80','null','{\"app\": \"nginx-deployment\"}');
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14 15:59:49
