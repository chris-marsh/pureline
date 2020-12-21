# Ansible playbook for pureline deployment

Here is an ansible playbook that you need to customize and you can use to install pureline on one or more systems.

Features:
* Gets the latest pureline git version and installs it to /usr/local/pureline
* Deploys to a list of users (defined in the playbook)
* Activates in .bashrc
* Selects one of 8 "random" colors for the ssh plugin. The randomness is deterministic and depends on the remote system's hostname.
* Copies the pureline.conf from this directory as a base (derived from the 256 color example, but with extra colors)

Usage:
* Edit `hosts` and make sure you have ansible working (ssh keys deployed, etc)
* Edit `pureline.conf` and make the adjustments you want
* Edit `pureline.yaml` and in the vars section define the usernames/homedirs and colors you want. Currently the playbook is configured to select one in 8 colors, but you can redefine/extend it.
```
  vars:
    users:
       - name: myuser
         home: /home/myuser
       - name: root
         home: /root

    color_map:
      '0': 'MyOrange'
      '1': 'MyLightGrey'
      '2': 'MyBlue'
      '3': 'MyLime'
      '4': 'MyDarkGreen'
      '5': 'MyDarkTeal'
      '6': 'MyDarkRed'
      '7': 'MyLightBlue'

```

* Run the playbook with:
```
sudo ansible-playbook -i hosts pureline.yaml
```
