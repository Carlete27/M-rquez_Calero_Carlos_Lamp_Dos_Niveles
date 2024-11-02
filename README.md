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

Mientras la segunda maquina que tendra **MySQL**, solo dispondra de un adaptador de red interna dentro de la red privada denminada **"Lamp-2Niveles"** con la dirección ip "192.168.1.3/24".

Ejemplo de como seria en este caso la disposición del vagrantfile:
![image](https://github.com/user-attachments/assets/07aa3ecf-398b-47b8-82f3-e586ae1eada5)

#### 3.2 Configuración de la Maquina Apache
##### 3.2.1 Actualización de la Maquina e Instlación de Apache

