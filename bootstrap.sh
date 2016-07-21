#!/bin/bash

set -x

# The following line gets replaced by my_app by with
# environment variable definitions.

# __ENVIRONMENT_VARAIBLE_DEFS__

apt-get update
apt-get install -y git openjdk-8-jre python python-pip

pip install virtualenv

# checkout repos

# create and activate virtualenv and
# (upgrade pip/setuptools inside virtualenv) and
# install pip requirements defined in repos

pip install awscli


# download java jars

# at some point, might need to download from S3 a key
# for pulling from private github repos.

# run script...
