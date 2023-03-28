# Micro-Frontend Micro-Workshop

Welcome to the Micro-Frontend Micro-Workshop repository! This document provides instructions on how to set up your development environment for the interactive portion of the workshop.

More details about the workshop, including the date and time, can be found on the [Open edX Conference website](https://con.openedx.org/) and the [session page on Sessionize](https://2023-open-edx-conference.sessionize.com/session/435649).

# Setting up Devstack

To participate in the interactive portion of the workshop, you will need to set up your development environment using the Open edX Devstack. There are two options for setting up Devstack locally:

## Option 1: Use a pre-built VM image

This option is faster because all Docker images have already been pulled and the provision scripts have already run. Follow these steps to use this option:

### Prerequisites
* A QEMU/KVM-based virtualization solution
  * Linux
    * [QEMU (CLI)](https://www.qemu.org/)
    * [GNOME Boxes](https://apps.gnome.org/app/org.gnome.Boxes/)
    * [virt-manager](https://virt-manager.org/)
  * Mac
    * [QEMU (CLI)](https://www.qemu.org/download/#macos)
    * [UTM](https://mac.getutm.app/)

### Run a VM using the image 
* Download the pre-built VM image from [here](https://nightly.link/brian-smith-tcril/mfe-workshop-2023/workflows/generate_devstack_vm/main/devstack-bullseye.qcow2.zip). (~15GB compressed, ~35GB extracted)
* Verify the image using a checksum from [here](https://nightly.link/brian-smith-tcril/mfe-workshop-2023/workflows/generate_devstack_vm/main/checksums.zip).
* Set up the VM and forward the ports to access everything running in the VM from your host machine.
  * [Linux](DEVSTACK_VM_SETUP_LINUX.md)
  * [Mac](DEVSTACK_VM_SETUP_MAC.md)

### Run devstack in the VM
1. Log in to the VM with `username: devstack, password: devstack`
2. Run devstack
```bash
cd code/devstackworkspace
source devstack-venv/bin/activate
cd devstack
make dev.up.lms+studio
```

## Option 2: Install Devstack with Docker

This option involves installing Devstack based on the instructions found at https://github.com/openedx/devstack. Simplified instructions for this workshop can be found [here](DEVSTACK_DOCKER_SETUP.md).

# Running the Workshop Example Application

* Verify devstack is up and running correctly by going to http://localhost:18000/
* Follow the instructions in the README on https://github.com/brian-smith-tcril/frontend-app-workshop-example/
