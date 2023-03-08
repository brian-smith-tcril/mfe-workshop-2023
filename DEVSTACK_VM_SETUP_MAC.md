# QEMU (CLI)
The [QEMU documentation](https://www.qemu.org/download/#macos) includes instructions for installing QEMU via [Homebrew](https://brew.sh/) and [MacPorts](https://www.macports.org/).

Example using 8GB of RAM and 8 CPU cores:
```sh
$ qemu-system-x86_64 -m 8096 -accel hvf -smp 8 -netdev user,id=mynet.0,hostfwd=tcp::18000-:18000,hostfwd=tcp::18010-:18010 -device virtio-net-pci,netdev=mynet.0 -hda devstack-bullseye.qcow2
```

# UTM
[UTM](https://mac.getutm.app/) is also available as an option to run the VM with a GUI. Make sure ports `18000` and `18010` are forwarded.
