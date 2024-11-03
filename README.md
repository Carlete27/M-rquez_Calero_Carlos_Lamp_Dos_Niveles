# Practica Lamp en Dos Niveles Por Carlos Márquez Calero

## ÍNDICE
#### 1. Introducción
#### 2. Objetivo
#### 3. Desarrollo
#### 4. Recursos

## 1. Introducción
En esta practica vamos a desplegar una aplicación web sencilla, utilizando dos aplicaciones, como lo son **Vagrant** y **Virtual Box** para virtualizar un entorno digital
compuesto por dos maquina virtuales, una de ellas tendra instada una dependencia de **Apache** para poder lanzar un host virtual sobre la otra maquina que tendrá
instalado una dependencia de **MySQL**.

## 2. Objetivo
El objetivo de esta practica es poder lanzar una aplicación web con la cual podamos, de manera grafica mediante el usuo de nuestro navegador,
administrar una base de datos propia.

## 3. Desarrollo
#### 3.1 Configuración del archivo "Vagranfile"
Para llevar a cabo esta prácica configuraremos dos maquina virtuales en el mismo vagrantfile, unda de ellas sera la maquina que tendra **Apache** y esta tendra dos adaptadores de red,
uno de los adaptadores sera **NAT**, pra tener una red pública ya que este necesitará salir a internet, y el otro sera un adaptador de red interna con una **red privada**, llamda **"Lamp-2Niveles"**,
**"192.168.1.0/24"**, en este caso su dirección privada será **"192.168.1.2/24"**.

Mientras la segunda maquina que tendra **MySQL**, solo dispondra de un adaptador de red interna dentro de la red privada denminada **"Lamp-2Niveles"** con la dirección ip **"192.168.1.3/24"**.

Ejemplo de como seria en este caso la disposición del vagrantfile:
![image](https://github.com/user-attachments/assets/07aa3ecf-398b-47b8-82f3-e586ae1eada5)

#### 3.2 Configuración de la Maquina Apache

##### 3.2.1 Actualización de la Maquina e Instlación de Apache
Para iniciar las dos maquinas utilizaremos el comando **"vagrant up"**. Una vez iniciadas nos conectaremos via ssh a la maquina apache denominada **"Maquina01"** con el siguiente comando **"vagrant ssh Maquina01"**:
![image](https://github.com/user-attachments/assets/1623c90d-b958-4098-bb1e-11838a9be3d4)

Una vez dentro ejecutaremos dos comandos para poder actualizar la lista de repositorios y despues los repositorios a la ultima versión:

* Actualizamos la lista de paquetes:
  ![image](https://github.com/user-attachments/assets/8e6ff61f-6e20-4333-8214-8b0646c7b98d)

* Actualiamos los paquetes a la ultima versión:
  ![image](https://github.com/user-attachments/assets/4a9b3ff9-b23c-48c3-a1f9-315f22b1a7c7)

* Comprobamos que tenemos instalado la aplicación de Git en la maquina de apache:
  ![image](https://github.com/user-attachments/assets/e85906bc-5117-4ba6-b597-414f0e611b7c)

* Instalamos Apache2:
  ![image](https://github.com/user-attachments/assets/d9f4e53f-68b0-4b8d-87f9-a126820e12e9)

* Instalamos PHP:
  ![image](https://github.com/user-attachments/assets/4d30b7f6-9cd4-4508-a289-2df8e58acf4f)


##### 3.2.2 Configuración de apache y recursos necesarios
Una vez instalado apache2, comprobamos que este este iniciado de forma correcta, para ello iniciaremos la instancia de apache mediante el comando **"systemctl start apache2"** y ejecutaremos posteriormente
el siguiente comando **"systemctl status apache2"** prar ver el estado del servicio:
![image](https://github.com/user-attachments/assets/5c40e6bb-708b-411d-9a00-a297d6142038)

Entraremos al navegador y escribiremos **"http://localhost:8080"** y comprobaremos que se abre apache en el navegador:
![image](https://github.com/user-attachments/assets/9767955c-309d-4fae-942c-3ba2a09ffe32)

Ahroa nos dirigiremos al directorio "var/www/html", dentro de este crearemos al directorio **"Gestion_Usuarios"** y le daremos permisos tanto de Lectura (r), como de escritura (w), como de ejecución (x)
para nuestro usuario y los usuario que formen parte de nuestro grupo mediante el comando **"sudo chmod 770 /var/www/html/Gestion_Usuarios"** y cambiaremos el propietario del directorio prar tener control total sobre este con el siguiente comando **"sudo chown -R vagrant:vagrant /var/www/html/Gestion_Usuarios"**: 
![image](https://github.com/user-attachments/assets/319188a3-0f5f-4621-8160-575bef51c67e)
![image](https://github.com/user-attachments/assets/d8876c72-e8d7-4cab-883e-8d3b75a1ff53)

Dentro de este directorio, ejecutaremos un **"git clone"** para poder descargar los archivos del repositorio especificado en el enunciado de la practica mediante este enlace "https://github.com/josejuansanchez/iaw-practica-lamp.git":
![image](https://github.com/user-attachments/assets/fff1bc22-a3f6-4038-bf43-314f48725efc)

Movemos los archivos que estan dentro de la carpeta **"iaw-practica-lamp"** a la carpeta **"Gestion_Usuarios"** con el comando **"sudo mv iaw-practica-lamp/* /var/www/html/Gestion-Usuarios/"** y posteriormente eliminaremos el directorio clonado:
![image](https://github.com/user-attachments/assets/34b65648-15a7-4c84-b3d1-b5d450f716dd)
![image](https://github.com/user-attachments/assets/e23fa4c8-e4ad-4d4e-8d2f-b3a280710095)

La carpeta imprtante para esta prctica en la maquina apache es la carpeta **"src"** (search/recursos) en donde se encuentra el sitio al que querremos acceder. Dentro de este se encuantran los dos archivos mas importantes, clo cuales son el llamado **"config.php"** y **"index.php"**. El index.php como tal es el host al que vamos a dirigirnos atraves del navegador y el config.php es el archivo que necesitamos para que mediante la maquina de mysql este host virtual se conecte a la base de datos y funcione como tal la aplicación web:
![image](https://github.com/user-attachments/assets/46ed4f6e-8201-4c0e-9225-8a1dfe52d3b3)

Ahora nos dirigiremos al directorio de los sitos-disponibles o sites-availables cuya ruta sera **"/etc/apache2/sites-available"**, dentro de este crearemos ua copia del archivo que por defecto apache crea para su host virtual inicial, llamado **"000-default.conf"** y lo llamaremos a la copia **"gest-user.conf"**:
![image](https://github.com/user-attachments/assets/159a1b73-8dd3-4cef-927c-bdc9a541b956)

Posterior a lo anterior editaremos con nano el fichero nuevo y en la linea del document root le añariremos que se diriga a /Gestion_Usuarios/src para poder lanzar la aplicación web de forma correcta mediante el fichero index-php:
![image](https://github.com/user-attachments/assets/4d903265-6c93-4095-881b-04bfc8619067)

Una vez hecho todos los paso anteriores, mediante el comando **"sudo a2dissite 000-default.conf"** desabilitaremos este archivo de configuración y mediante el comando **"sudo a2ensite gest-user.conf"** habilitaremos el nuevo archivo de configuración de nuestra aplicación web y para guardar los cambios reiniciaremos el servicio de apache2 con el comando **"sytemctl restart apache2"**:
![image](https://github.com/user-attachments/assets/14e1189e-f03e-4e10-a705-fb6eee116cf4)


#### 3.3 Configuración de la maquina MySQL

##### 3.3.1 Actualización e intalación de MySQL
Ahora nos saldremos de la maquina apache diridiremos a la maquina de **"MySQL"** denominada **"Maquina02"**, e iniciamos el proceso de actualización e instalación de servicios,etc:
![image](https://github.com/user-attachments/assets/a09fb063-6e53-4589-9bf4-d1a79764742d)

* Actualizamos la lista de paquetes:
  ![image](https://github.com/user-attachments/assets/d96a3fe8-1ef1-4898-a460-98de0095cd6a)

* Actualiamos los paquetes a la ultima versión:
  ![image](https://github.com/user-attachments/assets/d688172e-c1b5-4ce8-bfd0-df4fe252aff5)

* Comprobamos que tenemos instalado la aplicación de Git en la maquina de mysql:
  ![image](https://github.com/user-attachments/assets/0549e348-c4f8-48af-9cb9-055bb956b885)

* Instalamos MySQL-Server:
  ![image](https://github.com/user-attachments/assets/2a8fe3e0-8a93-4149-a969-a2c992dc44b1)

##### 3.3.2 Configuración de MySQL
Una vez instalado mysql, iniciaremos el servicio y comprobaremos que este funciona de manera correcta como hicimos con apache:
![image](https://github.com/user-attachments/assets/ec382fdf-945f-435e-b5fa-da7f8ce63ab2)

Ahora haremos otro git clone desde el mismo enlace que tenemos en el enunciado de la paractica, pero esta vez eliminaremos la caperpeta src y el archivo README y dejaremos solo el directorio db con el archivo de la base de datos para poder importarlo a mysql:
![image](https://github.com/user-attachments/assets/460c4200-4a33-460e-98d8-de900dca2ef2)

Iniciaremos sesión en mysql con el usuario root he importaremos la base de datos que se encuantra en el ficheros .sql:
![image](https://github.com/user-attachments/assets/0bff3998-cfb5-44fe-8eea-3e25baf4b4cf)

Crearemos el usuario "carlos" con la dirección ip de la maquina apache "carlos@192.168.1.2", le daremos todos los privilegios sobre la base de datos lamp_db y reiniciaremos el servicio de mysql para guardar los cambios, comprobando al iniciar sesion con el usuario carlos que podemos usar la base de datos:
![image](https://github.com/user-attachments/assets/7bcb2870-2acc-497b-b190-d5fc3d70f166)

Posteriormente el el archivo de configuración de mysql cambiaremos la being address por la direción ip de la maquina de mysql y reiniciamos el servicio de mysql:
![image](https://github.com/user-attachments/assets/b69c15e8-2fa8-4f91-a01a-e56c59035539)
![image](https://github.com/user-attachments/assets/c603c5b0-4452-4e15-a098-43f99dc8a9b5)

Una vez finalizado lo anterior, no dirigiremos al archivo de configuracion del php en la maquina apache y cambiaremos todos los parametros como se muestra en la captura:
![image](https://github.com/user-attachments/assets/21f647a0-451e-46b3-9f76-03019825f61a)

Tras esto reiniciamos el servicio de apache y comprobamos en el navegador si podemos acceder a la base de datos:
https://github.com/user-attachments/assets/955f8dee-eb8a-44f4-a868-2205a1e2e2a9

## 4. Recursos

Para finalizar la práctica, realizare la composición de dos archivos bash o .sh para poder automatizar todo el proceso mostrado anteriormente y que su puesta en marcha sea lo mas rapido posible. 



















