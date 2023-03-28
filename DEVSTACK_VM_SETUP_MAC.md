# QEMU (CLI)
The [QEMU documentation](https://www.qemu.org/download/#macos) includes instructions for installing QEMU via [Homebrew](https://brew.sh/) and [MacPorts](https://www.macports.org/).

Example using 8GB of RAM and 8 CPU cores:
```sh
qemu-system-x86_64 -m 8096 -accel hvf -smp 8 -netdev user,id=mynet.0,hostfwd=tcp::18000-:18000,hostfwd=tcp::18010-:18010 -device virtio-net-pci,netdev=mynet.0 -hda devstack-bullseye.qcow2
```

# UTM
[UTM](https://mac.getutm.app/) is also available as an option to run the VM with a GUI. Make sure ports `18000` and `18010` are forwarded.

# M1 Macs
QEMU will work on M1 Macs, provided `qemu-system-x86_64` is added to the firewall exception rules in UTM settings.  However, because the provided image is x86_64, QEMU will have to start in emulation mode; this will make running the devstack a very CPU intensive process, and thus much slower.

For a better development experience, we suggest going through the steps of the bare-metal [devstack installation](https://github.com/openedx/devstack#getting-started).  Setup will take a lot longer, but the resulting environment will be actually usable for development.
