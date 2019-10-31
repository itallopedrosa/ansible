Role Name
=========

Inserir linha com o hostname e ip do servidor no arquivo /etc/hosts


Role Variables
--------------

Variaveis obtidas atraves do comando ansible -m setup

{{ ansible_default_ipv4	}} 		{{ ansible_nodename }}   {{ ansible_nodename }}


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - hosts_role

License
-------

BSD

Author Information
------------------

Itallo Pedrosa
