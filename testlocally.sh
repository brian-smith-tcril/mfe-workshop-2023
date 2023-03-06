packer build -only=debian_and_deps.* .
packer build -only=devstack_clone.* .
packer build -only=devstack_pull.* .
packer build -only=devstack_provision.* .