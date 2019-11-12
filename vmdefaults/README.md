Role Name
=========

Role criada para inserir servidores CentOS/RedHat no dominio (Active Directory / Samba 4)

Requirements
------------

Role Variables
--------------
Variavies usadas.

 - ad_username = variavel para inserir o nome do usuario que ira inserir os servidores no dominio;
 - user_pass = senha do usuario (hash);
 - ntp_server = servidor ntp;
 - domain_name = nome do dominio;

Example Playbook
----------------

Playbook

	ansible-playbook -i hosts vmdefaults.yml

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
