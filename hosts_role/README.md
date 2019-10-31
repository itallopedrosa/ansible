Role Name
=========

Inserir linha com o hostname e ip do servidor no arquivo /etc/hosts


Role Variables
--------------

Variaveis obtidas atraves do comando ansible -m setup

{{ ansible_default_ipv4	}} 		{{ ansible_nodename }}   {{ ansible_nodename }}


Example Playbook
----------------

Comando para rodar o playbook. 

ansible-playbook hosts.yaml


License
-------

BSD

Author Information
------------------

Itallo Pedrosa
