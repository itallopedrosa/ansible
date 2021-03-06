Simple zabbix-agent Role for Zabbix 3.2
=======================================

Role for Zabbix 3.2 for most popular linux distros with easy and minimal configuration.

Supported OSes
--------------
Debian 7 and 8  
Ubuntu LTS 16 and (not tested) 14  
RHEL / CentOS 6, 7 and (not tested) 5  

May support more OSes, please report any success/failures.

Role Variables
--------------

Whole configuration is 2 parameters only, and port is optional:

```
# Zabbix server to connect to
zabbix_agent_server: localhost
# Zabbix port in the server to connect to
zabbix_agent_server_port: 10051
```

```


Example Playbook
----------------

```
---
- hosts: zabbix-clients
  roles:
       - { role: zabbix-agent, zabbix_agent_server: zabbix.domain.local }
```

How to run
----------

``` 
ansible-playbook zabbix-agent.yml --limit zabbix-clients 
```

This role is conservative. It will try not upgrade or reconfigure existing agents.

Disclaimer
----------

No warranty. Use at your own risk. Test first.

License
-------

Apache Licence v2

http://www.apache.org/licenses/LICENSE-2.0
