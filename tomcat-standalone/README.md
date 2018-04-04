## Implantação Tomcat StandAlone

- Requisitos Ansible 1.2 ou maior
- CentOS/RHEL 6.x hosts

Estes playbooks implementam uma implementação básica do Tomcat Application Server, versão 7. 
Para usá-los, primeiro edite o arquivo de inventário "hosts" para conter os nomes de host das máquinas nas quais você deseja implementar o Tomcat 
e edite o arquivo group_vars / tomcat-servers 
para definir qualquer parâmetro de configuração do Tomcat que você precisa.

Then run the playbook, like this:

	ansible-playbook -i hosts site.yml

When the playbook run completes, you should be able to see the Tomcat
Application Server running on the ports you chose, on the target machines.

This is a very simple playbook and could serve as a starting point for more
complex Tomcat-based projects. 

### Ideas for Improvement

Here are some ideas for ways that these playbooks could be extended:

- Write a playbook to deploy an actual application into the server.
- Deploy Tomcat clustered with a load balancer in front.

We would love to see contributions and improvements, so please fork this
repository on GitHub and send us your changes via pull requests.
