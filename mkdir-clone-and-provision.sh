export PATH=$PATH:/home/devstack/.local/bin
pip install virtualenv
mkdir code
cd code
mkdir devstackworkspace
cd devstackworkspace
git clone https://github.com/openedx/devstack.git
virtualenv devstack-venv
source devstack-venv/bin/activate
cd devstack
make requirements
SHALLOW_CLONE=1 make dev.clone.https
make dev.pull.large-and-slow
make dev.provision