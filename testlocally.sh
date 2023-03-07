packer build -only=debian_and_deps.* .
packer build -only=devstack_clone.* .
packer build -only=devstack_pull_lms_ecommerce.* .
packer build -only=devstack_pull_all_the_rest.* .
packer build -only=devstack_provision.* .