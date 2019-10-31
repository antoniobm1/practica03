# Practica 3

https://github.com/antoniobm1/practica03.git

# 1.3 Configuración de MySQL

Edita el siguiente archivo de configuración:
```
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

Busca la directiva de configuración bind-address dentro del bloque de [mysqld]:
```
[mysqld]
bind-address = 127.0.0.1
```

En la configuración por defecto, MySQL sólo permite conexiones desde localhost (127.0.0.1). 


Si nuestra máquina dispone más de una interfaz de red podemos poner la dirección IP 0.0.0.0 para permitir que se puedan conectar a MySQL desde cualquiera de las interfaces de red disponibles.
```
[mysqld]
bind-address = 0.0.0.0
```

Una vez hecho esto tenemos que reiniciar el servicio de MySQL:
```
sudo /etc/init.d/mysql restart
```
# 1.4 Asignando privilegios a los usuarios de MySQL

Ahora tenemos que asignar privilegios al usuario de MySQL que vamos a utilizar para conectarnos desde la máquina donde está corriendo el servicio de Apache HTTP.
```
mysql -u root -p  
mysql> grant all privileges on DATABASE.* to USERNAME@IP-SERVIDOR-HTTP identified by 'PASSWORD';
mysql> flush privileges;
mysql> exit;
```
Si queremos permitir que un usuario se pueda conectar desde cualquier dirección IP podemos utilizar el comodín %. De modo que tendríamos que realizar lo siguiente:
```
mysql -u root -p  
mysql> grant all privileges on DATABASE.* to USERNAME@'%' identified by 'PASSWORD';
mysql> flush privileges;
mysql> exit;
```
Tenga en cuenta que tendrá que reemplazar los valores DATABASE, USERNAME y IP-SERVIDOR-HTTP por los valores que necesite.

# 1.5 Comprobamos que podemos conectarnos a MySQL

Ahora vamos a comprobar que podemos conectarnos con MySQL desde la máquina donde está corriendo el servicio de Apache HTTP. Podemos comprobarlo conectando con el shell de mysql:
```
mysql -u USERNAME -p -h IP-SERVIDOR-MYSQL
```
O haciendo un telnet al puerto donde está corriendo el servicio de MySQL:
```
telnet IP-SERVIDOR-MYSQL 3306
```
