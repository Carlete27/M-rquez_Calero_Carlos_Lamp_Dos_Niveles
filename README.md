# Practica Lamp en Dos Niveles Por Carlos Márquez Calero

## ÍNDICE
#### 1. Introducción
#### 2. Objetivo
#### 3. Desarrollo
#### 4. Conclusión
#### 5. Recursos

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

Movemos los archivos que estan dentro de la carpeta **"iaw-practica-lamp"** 





