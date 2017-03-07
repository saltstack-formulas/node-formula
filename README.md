# node

This formula installs [node.js](https://nodejs.org/en/).

## Installing from PPA

An example pillar for installing from Debian based PPA repository:

    node:
      version: 6.9.4
      install_from_ppa: True
      ppa:
        repository_url: https://deb.nodesource.com/node_6.x

## Installing from source

An example pillar file looks as follows:

    node:
      version: 5.4.0
      checksum: 1dfe37a00cf0ed62beb73071f571ac56697f544a98cc2ff3318faec6363d72ab
      make_jobs: 2
      install_from_source: True

Available versions can be found on [nodejs.org/dist/](https://nodejs.org/dist/); the checksums are listed in the
file `SHASUMS256.txt` in the respective version’s directory. The *node-v….tar.gz* checksum is used.

## Installing binary packages

On Linux, the binary node.js distribution can be installed to `/usr/local/share/` with the following pillar file:

    node:
      version: 5.4.0
      checksum: f037e2734f52b9de63e6d4a4e80756477b843e6f106e0be05591a16b71ec2bd0
      install_from_binary: True

The checksum for the *node-v…-linux-x64.tar.gz* file has to be provided.

### Older versions

When building from sources, only newer node versions with npm included are supported (Versions 0.9.x and newer should
be safe). Also, the executable will be called `node`.

If you need to install older versions, where the executable is called `nodejs`, use 
[previous commits](https://github.com/saltstack-formulas/node-formula/commit/bcc649588c162686c4dbde486da840ccd060edf6)
of this formula.

## Installing from packages

See the [example pillar file](https://github.com/saltstack-formulas/node-formula/blob/master/pillar.example).
