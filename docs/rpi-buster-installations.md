# Podman Installations on Raspberry Pi OS (Buster)


## Upgrading from Buster to Bullseye

In `/etc/apt/sources.list`, change from `Buster` to `Bullseye`:
```
deb http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi
```

Podman installations may failed with error "libc6-dev : Breaks: libgcc-8-dev (< 8.4.0-2~) but 8.3.0-6+rpi1 is to be installed". Install `gcc-8-base` to prevent the error:
```
$ sudo apt update && sudo apt install gcc-8-base
```

Install Podman and its dependencies:
```
$ sudo apt update && sudo apt install dnsmasq podman
```

Fix missing `dnsname` plugin:
```
$ sudo ln --symbolic /usr/lib/dnsname /usr/lib/cni/dnsname
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

Fix `ERRO[0018] unable to write pod event: "write unixgram @0000c->/run/systemd/journal/socket: sendmsg: connection refused"`. Also see https://github.com/containers/podman/issues/4325. Create `~/.config/containers/containers.conf` and `/etc/containers/containers.conf` with the following line:
```
[engine]
events_logger = "file"
```

Reboot.

After reboot, execute the following command to fix "there might not be enough IDs available in the namespace" error when pulling image. See https://github.com/containers/podman/issues/3421#issuecomment-544455837:
```
$ podman system migrate
```


## SaltStack installations after Bullseye upgrade

Installations using `bootstrap.sh` may no longer works. Thus, manual installation is required.

Install dependencies:
```
$ sudo apt install vim python3 python3-dev python3-virtualenv libzmq3-dev build-essential openssh-client iputils-ping lsof
```

Create `virtualenv` and then install `salt` as root:
```
$ python3 -m virtualenv --python=$(which python3) ~/virtualenv/saltstack
$ source ~/virtualenv/saltstack/bin/activate
(saltstack) $ sudo python3 -m pip install salt
```
