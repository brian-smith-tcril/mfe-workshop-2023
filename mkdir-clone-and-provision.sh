mkdir code
cd code
mkdir devstackworkspace
cd devstackworkspace
git clone https://github.com/openedx/devstack.git
virtualenv devstack-venv
source devstack-venv/bin/activate
cd devstack
make requirements
make dev.clone.https
make dev.pull.large-and-slow
make dev.provision