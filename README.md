# Ansible for Born2beroot
## Requirements
In order to use this playbook, the user must have sudo rights.
Furthermore, I recommend setting up a host named "vm" in the SSH config.
```
Host vm
    HostName [Your server IP]
    User [Your server username]
    Port [Your server SSH port]
    IdentityFile [Your SSH key]
```