```
$ packer build fedora-packer.json
$ ansible-playbook -i 'fedora.local,' -u shanemcd --become bootstrap-fedora.yml
```
