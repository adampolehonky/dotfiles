#!/usr/local/bin/ python
# pip(python2) && pip3(python3) package updater
# By Adam Polehonky
# This file will update all outdated Python packages with pip & pip3.

import pip
from subprocess import call


for dist in pip.get_installed_distributions():
    # Calls for pip & pip3 to update all packages, adds sudo -H as failsafe
    call("sudo -H pip install --upgrade " + dist.project_name, shell=True)
    call("sudo -H pip3 install --upgrade " + dist.project_name, shell=True)


print("All done.")
