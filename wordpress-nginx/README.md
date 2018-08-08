## WordPress + Nginx + Implementação do PHP-FPM

- Requer Ansible 1.2 ou mais recente
- Compativel com hosts do CentOS / RHEL 6.x

WordPress e CMS, frontend pelo servidor web Nginx e pelo
PHP-FPM. Para usar, copie o arquivo `hosts.example` para` hosts` e
edite o arquivo de inventário `hosts` para incluir os nomes ou URLs dos servidores
você deseja implantar.

Em seguida, execute o playbook:

ansible-playbook -i hosts site.yml
