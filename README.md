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