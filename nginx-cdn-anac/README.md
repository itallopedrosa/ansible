# Ansible Nginx Role
-------

Esta Role Ansible fornecerá uma nova instalação do servidor  Web Nginx no sistema Operacional CentOS e fornecerá algumas ferramentas e atuará como CDN.


## Pre-Requisitos
-------

__1. &nbsp;&nbsp; Instalação de Dependencias:__ <br>

> RedHat based distros (RHEL, CentOS):

```bash
sudo yum -y install epel-release
sudo yum clean all
sudo yum -y install ansible
```


__4. &nbsp;&nbsp; Set ansible host:__

Set Ansible localhost entry so that ansible knows it will run against localhost and can talk to itself on localhost without attempting to open a TCP socket connection.

<br>

```bash
echo localhost ansible_connection=local > /etc/ansible/hosts
```

<br>

## Variaveis
-------

Variaveis utilizadas na Role.

<br>

> Ansible Variables:

 - http_port: 80
 - https_port: 443
 - status_port: 8080
 - site_name: "ansible_nodename"
 - nginx_ssl_dir: "/etc/ssl/certs/"

<br>

> Opcional : Variaveis de Ambiente:

 - HTTP_PORT - Port nginx will listen on for http connections [default:80]
 - HTTPS_PORT - Port nginx will listen on for https connections [default:443]
 - STATUS_PORT - Port nginx will use to serve web server stats [default:8080]
 - SITE_NAME - Site that nginx will set up a default server instance for [default:"ansible_nodename"]
 - SSL_DIR - Location that nginx will store any generated certificates [default:"/etc/nginx/ssl"]

<br>

 > Setando Variaveis de Ambiente:

 Para configurar variável de ambiente, execute o comando.

<br>

```bash
export SITE_NAME="mydomain.com"
```


This playbook will perform the following tasks:

 - If `SITE_NAME` has not been set, or is still set to nginx.local, then the reconfig playbook will simply generate a self signed certificate for the nginx.local domain and restart the nginx process, skipping all other major steps in the playbook.
 - If a certificate already exists for nginx.local, it will detect the existing cert and skip the cert generation step as well.
 - If `SITE_NAME` has been exported to a value other than nginx.local, then the playbook will use the value of `SITE_NAME`
 - The __/var/www/html/nginx.local__ directory will be renamed to __/var/www/html/mydomain.com__
 - The __/etc/nginx/conf.d/nginx.local.conf__ will be moved to __/etc/nginx/conf.d/mydomain.com.conf__
 - All paths, log names and references of nginx.local with be replaced with mydomain.com mydomain.com.conf file
 - A new self signed certificate key pair will be generated for mydomain.com and placed in __/etc/nginx/ssl__



License
-------

BSD

Author Information
-------

[Itallo Pedrosa](http://github.com/itallopedrosa) <br>
