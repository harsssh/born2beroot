# Ansible for Born2beroot
## Requirements
In order to use this playbook, the user must have sudo rights.

Furthermore, by setting up a host named "vm" in the SSH config as follows, 
you can eliminate the need for manual host definitions.
```
Host vm
    HostName [Your server IP]
    User [Your server username]
    Port [Your server SSH port]
    IdentityFile [Your SSH key]
```

## Usage
1. Set the `login_name` variable in `host_vars/vm.yml` to your login name.
2. Run the playbook as follows:
```
ansible-playbook playbook.yml
```