# Micro-Frontend Micro-Workshop Readme

Welcome to the Micro-Frontend Micro-Workshop repository! This document provides instructions on how to set up your development environment for the interactive portion of the workshop.

More details about the workshop, including the date and time, can be found on the Open edX Conference website and the session page on Sessionize.

## Setting up Devstack

To participate in the interactive portion of the workshop, you will need to set up your development environment using the Open edX Devstack. There are two options for setting up Devstack locally:

### Option 1: Use a pre-built VM

This option is faster because all Docker images have already been pulled and the provision scripts have already run. Follow these steps to use this option:

1. Download the pre-built VM image from [here](https://nightly.link/brian-smith-tcril/mfe-workshop-2023/workflows/generate_devstack_vm/use-selfhosted/devstack-bullseye.qcow2.zip). (~14GB compressed, ~33GB extracted)
2. Verify the image using a checksum from [here](https://nightly.link/brian-smith-tcril/mfe-workshop-2023/workflows/generate_devstack_vm/use-selfhosted/checksums.zip).
3. Set up the VM and forward the ports to access everything running in the VM from your host machine. You may refer to the [example config file](EXAMPLE_VM_CONFIG.md) or the step by step instructions for [Linux](DEVSTACK_VM_SETUP_LINUX.md) or [Mac](DEVSTACK_VM_SETUP_MAC.md).
4. Verify that everything is working correctly by going to http://localhost:18000/ and seeing an Open edX page.

### Option 2: Install Devstack with Docker

This option involves installing Devstack based on the instructions found at https://github.com/openedx/devstack. Simplified instructions for this workshop can be found [here](DEVSTACK_DOCKER_SETUP.md).

## Running the Frontend Template Application

The Frontend Template Application can be found at https://github.com/openedx/frontend-template-application. Once you have set up Devstack, the template app should be running at http://localhost:8080.

## Building an MFE

Congratulations, you are all set up and ready to start [building an MFE](BUILD_AN_MFE.md)!
