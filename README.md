# My Dotfiles Script

Script com todas as minhas configurações que uso na minha maquina. 


## Requisitos
- [Ansible](https://docs.ansible.com/ansible/latest/index.html) 
- [Dotdrop](https://dotdrop.readthedocs.io/en/stable/).


## Como usar


Instale o Ansible e as collections e depois execute o playbook:
```shell
sudo dnf install ansible -y  # Fedora
ansible-galaxy install -r playbook/requirements.yml
ansible-playbook playbook/tasks.yml --ask-become-pass
```

> Se não tiver o dotdrop instalado: `pipx install dotdrop`.

Comparar repositório com sistema host (ou novo sistema antes da instalação)
```shell
dotdrop compare
```

Instalar em um novo host
```shell
dotdrop install 
```

Instalar as extensões do Gnome
```shell
chmod +x extensions_intaller.sh
./extensions_intaller.sh
```

Agora, restarte o sistema e seja felix ;)
