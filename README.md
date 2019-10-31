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
