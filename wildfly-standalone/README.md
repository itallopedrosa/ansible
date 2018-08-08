## WildFly JBoss Deploy

- Requer Ansible no minimo a versão 1.2
- CentOS/RHEL 6 ou 7.


Instalação do App Server WildFly e deploy de aplicação java via Ansible.

Comando para executar o playbook:

	ansible-playbook -i hosts site.yml
	ansible-playbook -i hosts deploy-application.yml



### Ideias para melhorias.


- Criar um playbook ou um módulo Ansible para configurar os usuários do JBoss.
- Criar um playbook para inserir dois servidores wildfly no balanceador Nginx.


