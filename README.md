# Micro-Frontend Micro-Workshop

This 90 minute tutorial will give potential micro-frontend developers a chance to learn what it takes to start building a micro-frontend for the Open edX platform. Attendees should be familiar with GitHub, development practices, and have a Mac or Linux laptop with them.

* [Open edX Conference](https://con.openedx.org/)
* [Session Info @ Sessionize](https://2023-open-edx-conference.sessionize.com/session/435649)

## Setting up your dev environment

In order to participate in the interactive portion of this workshop, you should have the [Open edX Devstack](https://github.com/openedx/devstack) running locally. `todo: wording 2 options`

### install devstack with docker no vm

### use a pre-configured vm
* download
* todo nightly.link

https://nightly.link/brian-smith-tcril/mfe-workshop-2023/workflows/generate_devstack_vm/use-selfhosted/checksums.zip
https://nightly.link/brian-smith-tcril/mfe-workshop-2023/workflows/generate_devstack_vm/use-selfhosted/devstack-bullseye.qcow2.zip

* Linux todo link
* Mac todo link


if you know your way around qemu just grab the image `TODO_LINK_HERE` and make sure `TODO_PORTS_HERE` are forwarded

if you're new to qemu, you have some options

mac: https://mac.getutm.app/ `TODO_LEARN_HOW_THIS_WORKS_AND_WRITE_INSTRUCTIONS`

linux: https://apps.gnome.org/app/org.gnome.Boxes/ https://virt-manager.org/

https://github.com/openedx/frontend-template-application

### credits

devstack-vm.pkr.hcl based off https://github.com/tylert/packer-build/blob/ae7023158a026ab6d86b82579902987a98a578d6/source/debian/11_bullseye/base.pkr.hcl

base.preseed based off https://github.com/tylert/packer-build/blob/ae7023158a026ab6d86b82579902987a98a578d6/source/debian/11_bullseye/base.preseed
