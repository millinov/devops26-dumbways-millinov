# Task Day 7 / Week 3

Disini saya mengerjakan task Bootcamp DevOps Day 7 atau Week 3, Penamaan biar sama saya buat foldernya day 7.
Tasknya sendiri dikerjakan selama 1 minggu ini di week 3 bootcamp.

## Appserver for deploying Database & Gateway for deploying Frontend Application, Backend Application, And Web Server

![VM Instances](image/vm-instance.png)

Disini saya menggunakan Google Cloud Platform dimana saya membuat VM buat masing-masing app (Frontend, Backend, Webserver, dan Database)

## Create new user for all of your server

Sebelumnya saya sebenernya sudah bikin user buat konek ke lokal tapi buat tugas ini saya lihatkan bagaimana saya membuat user dengan bash di masing-masing VM

![Add User Frontend Server](image/addusr-frontend.png)

![Add User Backend Server](image/addusr-backend.png)

![Add User Web Server](image/addusr-webserver.png)

![Add User Database Server](image/addusr-database.png)

## The server only can login with SSH-KEY without using password at all

Ini sudah saya buat di config lokal

![SSH Config di Lokal](image/ssh-config.png)

Jadi jika saya ingin mengakses servernya tinggal menggunakan ```ssh *nama host* ```

## Deploy database MySQL

![MySQL secure installation](image/secure-sql.png)

Saya sebelumnya sudah setup di server database tapi kurang lebih tampilannya seperti ini.
Kemudian saya juga sudah setup root dengan password

![Login to MySQL root with password](image/root-pwd.png)

Saya juga sudah membuat user baru di dalam mysql

![Add User on MySQL](image/addusr-mysql.png)

Saya juga sudah menambah databases di dalam mengunakan ```CREATE DATABASE demo;```
Ada dua database baru yaitu demo dan wayshub yang akan lebih detail di next task.

![Add Database](image/new-database.png)

Saya juga ubah MySQL bind address di /etc/mysql/mysql.conf.d/mysqld.cnf dari ```127.0.0.1``` jadi ip private server database

![bind address](image/mysqld-cnf.png)

## Role Based

![Table Transaction di database demo](image/table-transaction.png)

Saya sudah membuat database demo dengan table transaction yang masih kosong

#### Create Admin

![Role Admin](image/role-admin.png)

#### Create Guest

![Role Guest](image/role-guest.png)

### Create user for role

![Create user untuk admin](image/admin-sql.png)

![Create user untuk guest](image/guest-sql.png)

### Testing Guest

![Testing Guest 1](image/test-guest1.png)

Bisa dilihat guest hanya bisa mengakses database demo dan tidak ada database wayshub dan lainnya;

![Testing Guest 1](image/test-guest2.png)

Saat guest mencoba insert row ke table di deny karena tidak ada privilegenya.

### Testing Admin

![Testing Admin 1](image/test-admin1.png)

Bisa dilihat admin sama dengan guest hanya bisa mengakses database demo dan tidak ada database wayshub dan lainnya, tetapi bisa insert juga kali ini

![Testing Admin 2](image/test-admin2.png)

Buat UPDATE dan DELETE juga terlihatnya bisa dilakukan ya jadi sudah benar

## Remote User

Pertama saya kasih liat bukti kalau saya install mysql-client di local saya dan bukan servernya

![MySQL Client Proof](image/mysql-proof.png)

Kemudian saya konek ke database-server di google cloud

![MySQL Client Remote](image/mysql-remote.png)

## Deploy Wayshub-Backend

![Wayshub Backend](image/wayshub-backend.png)

Sebelumnya backend wayshub sudah saya clone dan sudah saya jalankan di pm2 menggunakan ecosystem.config.json
Saya juga sudah ubah wayshub-backend/config/config.json menyesuaikan database servernya

![Wayshub Backend 2](image/wayshub-backend2.png)

## Deploy Wayshub-Frontend Application

![Wayshub Frontend](image/wayshub-frontend.png)

Sama seperti backend saya sudah clone gitnya dan install npm menggunakan node version 14
Saya sudah juga merubah src/config/api.js menyesuakan server backend

![Wayshub Frontend 2](image/wayshub-frontend2.png)

