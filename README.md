# node

This formula installs [node.js](https://nodejs.org/en/).

## Installing from source

An example pillar file looks as follows:

    node:
      version: 5.1.0
      checksum: 25b2d3b7dd57fe47a483539fea240a3c6bbbdab4d89a45a812134cf1380ecb94
      make_jobs: 2

Available versions can be found on (nodejs.org/dist/)[https://nodejs.org/dist/]; the checksums are listed in the
file `SHASUMS256.txt` in the respective version’s directory.

### Older versions

When building from sources, only newer node versions with npm included are supported (Versions 0.9.x and newer should
be safe). Also, the executable will be called `node`.

If you need to install older versions, where the executable is called `nodejs`, use 
[previous commits](https://github.com/saltstack-formulas/node-formula/commit/bcc649588c162686c4dbde486da840ccd060edf6)
of this formula.

## Installing from packages

See the (example pillar file)[https://github.com/saltstack-formulas/node-formula/blob/master/pillar.example].
