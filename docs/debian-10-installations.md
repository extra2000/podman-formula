# Podman Installations on Debian 10 (Buster)

Unfortunately, Podman is only availble on Bullseye repo. See https://podman.io/getting-started/installation#debian. Thus, it is recommended to start a fresh installed Debian 10 and then upgrade from Buster to Bullseye. This Chapter shall demonstrate how to upgrade from Buster to Bullseye according to [official tutorial](https://wiki.debian.org/DebianTesting) and then install Podman.


## Upgrading from Buster to Bullseye

In `/etc/apt/sources.list`, change from `Buster` to `Bullseye` and comment unrelated lines as follow:
```
deb http://deb.debian.org/debian/ bullseye main
deb-src http://deb.debian.org/debian/ bullseye main

#deb http://security.debian.org/debian-security buster/updates main
#deb-src http://security.debian.org/debian-security buster/updates main

#deb http://deb.debian.org/debian/ buster-updates main
#deb-src http://deb.debian.org/debian/ buster-updates main
```

Update repository:
```
$ sudo apt update
```


## Installing Podman

To install stable Podman from `bullseye` repository:
```
$ sudo apt install podman
```

Alternatively, to install Podman from [Kubic testing repository](https://software.opensuse.org/download/package?package=podman&project=devel%3Akubic%3Alibcontainers%3Atesting):
```
$ echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/testing/Debian_Unstable/ /' | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:testing.list
$ curl -fsSL https://download.opensuse.org/repositories/devel:kubic:libcontainers:testing/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/devel_kubic_libcontainers_testing.gpg > /dev/null
$ sudo apt update && sudo apt install podman slirp4netns golang-github-containernetworking-plugin-dnsname
```


## Rootless configuration

Create `/etc/sysctl.d/01-max-user-namespaces.conf` file with the following lines:
```
user.max_user_namespaces=10000
kernel.unprivileged_userns_clone=1
```

Make sure the following line exists in `/etc/subuid` (change `vagrant` to your username):
```
vagrant:100000:65536
```

Also make sure the following line exists in `/etc/subgid` (again change `vagrant` to your username):
```
vagrant:100000:65536
```


## Fix Rootless CNI Infra exists on boot

Create user's systemd directories:
```
$ mkdir -pv ~/.config/systemd/user/default.target.wants ~/.config/systemd/user/multi-user.target.wants
```

Create `~/.config/systemd/user/remove-rootless-cni-infra.service` with the following lines:
```
[Unit]
Description=Remove "rootless-cni-infra" Podman container on startup, to prevent issues when starting up rootless pod.
DefaultDependencies=no
Before=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/podman rm --force rootless-cni-infra
TimeoutStartSec=0

[Install]
WantedBy=multi-user.target default.target
```

Enable the `remove-rootless-cni-infra.service`:
```
$ systemctl --user daemon-reload
$ systemctl --user enable remove-rootless-cni-infra.service
```

Reboot.

After reboot, execute the following command to fix "there might not be enough IDs available in the namespace" error when pulling image. See https://github.com/containers/podman/issues/3421#issuecomment-544455837:
```
$ podman system migrate
```
