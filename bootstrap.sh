#!/bin/bash

set -x

# The following line gets replaced by my_app.py  with
# environment variable definitions.

# __ENVIRONMENT_VARIABLE_DEFS__

# After the replacement happens, there should be
# environment variables exported called:
# SESSION_ID, PROJECT_ID, TOKEN, REGION, SAMPLE, HLA_CLASS,
# PRIMER_MASK_VERSION, APP_SESSION_NAME

apt-get update
apt-get install -y git openjdk-8-jre python python-pip

pip install virtualenv awscli ipython


# at the moment, no credentials are necessary to do this:
git clone https://github.com/dtenenba/gems-worker.git

cd gems-worker
# create and activate virtualenv and
# (upgrade pip/setuptools inside virtualenv) and
# install pip requirements defined in repos

virtualenv env
. env/bin/activate
pip install -r requirements.txt


# download java jars
cd
mkdir jars
export JARS_DIR=$(pwd)/jars
# TODO bucket name might change depending on environment
aws s3 cp s3://worker-bootstrap-dev ./jars/ --include '*.jar' --recursive

# at some point, might need to download from S3 a key
# for pulling from private github repos.

# run script...
cd gems-worker
python typer.py 2>&1|tee -a /var/log/typer.log
