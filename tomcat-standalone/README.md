## Implantação autônoma do Tomcat

- Requer Ansible 1.2 ou mais recente
- Espera hosts do CentOS / RHEL 6.x

Estes playbooks implementam uma implementação muito básica do Tomcat Application Server,
versão 7. Para usá-los, primeiro edite o arquivo de inventário "hosts" para conter o
hostnames das máquinas nas quais você deseja que o Tomcat seja implantado e edite o
arquivo group_vars / tomcat-servers para definir qualquer parâmetro de configuração do Tomcat que você precisa.

Em seguida, execute o playbook com o comando abaixo, assim:


ansible-playbook -i hosts site.yml
