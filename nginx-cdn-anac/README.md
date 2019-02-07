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

## Variáveis
-------

Variáveis utilizadas na Role.

<br>

> Ansible Variables:

 - http_port: 80
 - https_port: 443
 - status_port: 8080
 - site_name: "ansible_nodename"
 - nginx_ssl_dir: "/etc/ssl/certs/"

<br>

> Variáveis:

 - HTTP_PORT -  [default:80]
 - HTTPS_PORT -  [default:443]
 - STATUS_PORT - [default:8080]
 - SITE_NAME - [default:"ansible_nodename"] - HOSTNAME DO SERVIDOR
 - SSL_DIR - Local de armazenamento de certificador [default:"/etc/nginx/ssl"]


License
-------

BSD

Author Information
-------

[Itallo Pedrosa](http://github.com/itallopedrosa)
