if you know your way around qemu just grab the image and make sure `TODO_PORTS_HERE` are forwarded

if you're new to qemu, you have some options

linux: https://apps.gnome.org/app/org.gnome.Boxes/ https://virt-manager.org/


# todo
finish port forwarding instructions, for now, based on https://unix.stackexchange.com/a/519067

make vm from image with gnome boxes

`virsh list` or `virsh -c qemu:///session list --all`

find the name of the devstack vm, mine was `debian11`

```bash
$ virsh list
 Id   Name       State
--------------------------
 3    debian11   running

$ virsh -c qemu:///session list --all
 Id   Name            State
--------------------------------
 3    debian11        running
```

edit the config (i had issues trying to edit using the gnome boxes UI, it wouldn't save the config)
```
$ virsh edit debian11
```

remove the `user` interface block `<interface type='user'>`

add qemu namespace to root tag
```xml
<domain type='kvm'>
```
to
```xml
<domain type='kvm' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
```
add command line stuff to the end
```xml
  <qemu:commandline>
    <qemu:arg value='-netdev'/>
    <qemu:arg value='user,id=mynet.0,net=10.0.10.0/24,hostfwd=tcp::18000-:18000'/>
    <qemu:arg value='-device'/>
    <qemu:arg value='virtio-net-pci,netdev=mynet.0,bus=pcie.0,addr=0x3'/>
  </qemu:commandline>
```
