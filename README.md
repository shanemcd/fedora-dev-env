# My development environment

This repo contains automation for my development environment.

Although you may find something useful here, it is very specific to my needs and you will certainly need to change something.

## Prerequisites

- macOS
- VMware Fusion
- Packer
- Ansible

## Usage

### Creating the VM

From the root of this repo:

```
$ ansible-playbook ansible/install-fedora.yml -v \
    -e fedora_username=shanemcd \
    -e github_username=shanemcd \
    -e packer_dir=$PWD/packer
```

#### Variables

| **Name**            | **Description**                                                              | **Default**                  |
| ------------------- | ---------------------------------------------------------------------------- | ---------------------------- |
| `vm_name`           | Name of the VM                                                               | `fedora{{ fedora_version }}` |
| `fedora_username`   | User created via kickstart                                                   | None                         |
| `fedora_version`    | Version of Fedora to install. Will attempt to find latest release if omitted | latest                       |
| `github_username`   | GitHub username (used for obtaining public keys)                             | None                         |
| `packer_dir`        | Absolute path to the Packer configuration                                    | None                         |
| `packer_output_dir` | Absolute path where the resulting VM directory will be created               | `~/VMs`                      |
| `cpus`              | Number of CPUs to give the VM                                                | 8                            |
| `memory`            | Amount of memory to give the VM, in megabytes                                | 12GB                         |
| `disk_size`         | Amount of storage to give the VM, in megabytes                               | 100GB                        |


### Bootstrapping the VM

TODO: Maybe use the ansible packer provisioner?

```
$ ansible-playbook -i fedora37.local, -v ansible/bootstrap-fedora.yml
```
