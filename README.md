# wpps

Enviar y recibir ejemplos de codigo utilizando twitter y pastie.

## Requerimientos

wpps está desarrollado completamente en Ruby, a través del sistema de
paquetes `ruby gems` y la aplicación depende de las siguientes "gemas":

- twitter 5.16.0
- pastie-api 0.2.1
- faraday 0.9.2
- faraday_middleware 0.10.0
- nokogiri 1.6.8.1

Ruby debe ser instalado utilizando las versiones del mismo que permitan construir
código nativo en cada plataforma.

### Linux

En Linux existen muchas distribuiciones. Vamos a mencionar solamente dos de ellas:

#### Linux Ubuntu

En Ubuntu se debe instalar ruby y su versión de desarrollo:

```
$ sudo apt-get install ruby-full
```

#### Linux Fedora

En Fedora se debe instalar ruby y su versión de desarrollo:

```
$ sudo dnf install ruby ruby-devel
```

### OS/X

En OS/X utilizando Homebrew

```
$ brew instal ruby
```

## Instalando wpps

Una vez instalado el ruby con el sistema de gemas. Es necesario instalar `wpps`:

```
$ gem install wpps
```

El anterior comando se encarga de instalar el sistema.

## Creando fichero de permisos en twitter

Si se quiere compartir ficheros con los estudiantes a través de wpps. En primer
lugar, se debe tener una cuenta en twitter.

Una vez creada la cuenta en twitter se abre el url: https://apps.twitter.com.
Como se ve en la siguiente imagen se obtiene la visión de las aplicaciones que
tiene el usuario, actualmente muestra dos. Vamos a crear una aplicaciones, para
ello presionamos el botón `Create New App`.

![Imagenes](./imagenes/twitter_apps.png)

Una vez presionado el botón obtenemos la siguiente pantalla:

![Imagenes](./imagenes/twitter_create_app.png)

Esta pantalla solicita la información para la aplicación:

* Name. Nombre de la aplicación. Esta es un nombre hasta 32 caracteres se sugiere nombres en minúsculas, sin espaciones y si lo requeire separar con guión bajo.
* Description. Descripción de la aplicación. La descripción de la aplicación, es un texto que describe la aplicación entre 20 y 200 carácteres.
* Website: Sitio web. URL válido de la dirección donde reside la información de la aplicación.
* Callback URL (opcional). URL de llamada de retorno. El URL que es establecido para recibir el token de autorización en un página que pueda procesarlo. No es necesario para la aplicación.

Para poder compartir la aplicación wpps, enviar y recibir código. Debe crear dos apliaciones: una para el envio (`wp`) y otra para recibir (`wpps`). Suponga que vamos a definir una apliaciones para enviar ficheros `send_file2`. Estos serían los campos a llenar:

* Name: `send_file2`
* Description: Application to send source files using twitter and pastie.
* Website: http://www1.eafit.edu.co/fcardona

Una vez creada la aplicación aparece la siguiente página:

![Imagenes](./imagenes/twitter_send_file2_app.png)

Ya la aplicación esta definida dentro de twitter, pero falta establecer los permisos que la aplicación puede tener. Los permisos se acceden a través de la pestaña Permission.




Son tres los tipos de permisos que permite la aplicación:

* Read only,
* Read and write,
* Read, write and Access direct messages.

Para las aplicaciones de enviar ficheros se deben tener los permisos de Read and write

 Copyright (c)  Copyright Holder All Rights Reserved.
