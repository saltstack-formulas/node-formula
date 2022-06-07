# Changelog

# [2.4.0](https://github.com/saltstack-formulas/node-formula/compare/v2.3.0...v2.4.0) (2022-06-07)


### Continuous Integration

* **kitchen+gitlab:** update for new pre-salted images [skip ci] ([3c2ee6e](https://github.com/saltstack-formulas/node-formula/commit/3c2ee6eb11c81903961973814938ed1d6f649698))
* **vagrant:** use `linked_clone` at all times (inc. CI) [skip ci] ([0db341d](https://github.com/saltstack-formulas/node-formula/commit/0db341da2589d73cccd25776471ca35cfa485731))


### Features

* **os*map:** update version installed on Debian/Ubuntu ([b0c4bd9](https://github.com/saltstack-formulas/node-formula/commit/b0c4bd9041b5e3826412804c16e11f8a99287807))
* **os*map:** update version installed on Debian/Ubuntu [skip ci] ([f204851](https://github.com/saltstack-formulas/node-formula/commit/f2048513e84fb3eb445668303386c2ffbcda3c89))


### Tests

* **system.rb:** add support for `mac_os_x` [skip ci] ([74d8a56](https://github.com/saltstack-formulas/node-formula/commit/74d8a56bf4edc4438d067fd3881591e808fa5e70))

# [2.3.0](https://github.com/saltstack-formulas/node-formula/compare/v2.2.0...v2.3.0) (2022-03-24)


### Continuous Integration

* enable Vagrant-based testing using GitHub Actions ([0d1bd4a](https://github.com/saltstack-formulas/node-formula/commit/0d1bd4a31185bce4cc6b5ebeeb198dfb5f9d7874))
* update linters to latest versions [skip ci] ([ed63546](https://github.com/saltstack-formulas/node-formula/commit/ed63546091e9d140d264f8bc88842134a2fb0dac))
* **gemfile:** allow rubygems proxy to be provided as an env var [skip ci] ([478c2c7](https://github.com/saltstack-formulas/node-formula/commit/478c2c76584777701df8028f3bb35d75b577bcd1))
* **kitchen+gitlab:** update for new pre-salted images [skip ci] ([7e237d1](https://github.com/saltstack-formulas/node-formula/commit/7e237d1e90327c8822b311205ddc14964df4ceeb))


### Documentation

* **readme:** add `Testing with Vagrant` section ([05c942e](https://github.com/saltstack-formulas/node-formula/commit/05c942ecb05f3a918fe762a7164cb2d9f7118cc7))


### Features

* **freebsd:** add support to work with the `default` suite ([0f50475](https://github.com/saltstack-formulas/node-formula/commit/0f50475063856a540f72217cb4bb2bad3501da0e))
* **openbsd:** add support to work with the `default` suite ([1d97949](https://github.com/saltstack-formulas/node-formula/commit/1d97949be7532fbbafd040c334846ac869a1be4b))
* **os*map:** update version installed on Debian/Ubuntu [skip ci] ([d4407fa](https://github.com/saltstack-formulas/node-formula/commit/d4407fa3e263eb8fced94657a61da2db7d902feb))
* **os*map:** update version installed on Debian/Ubuntu [skip ci] ([e806dcb](https://github.com/saltstack-formulas/node-formula/commit/e806dcbd4bee7fd085727383475ee47dc870ed95))
* **os*map:** update version installed on Debian/Ubuntu [skip ci] ([2976bf2](https://github.com/saltstack-formulas/node-formula/commit/2976bf2c7381fb3b5187caa4673d4d5d2db0f4b8))
* **osfingermap:** use last working version for Fedora 34 [skip ci] ([c38f422](https://github.com/saltstack-formulas/node-formula/commit/c38f4225b921d0a3d0e7291b4a3e86ab73ccc9c1))
* **windows:** add support to work with the `default` suite ([f1066d6](https://github.com/saltstack-formulas/node-formula/commit/f1066d6758552cee9b240fa33bb2cdb32e0a9d15))


### Tests

* **system:** add `build_platform_codename` [skip ci] ([de02abe](https://github.com/saltstack-formulas/node-formula/commit/de02abe07864c6e744283be2aa7ef818297d13af))

# [2.2.0](https://github.com/saltstack-formulas/node-formula/compare/v2.1.0...v2.2.0) (2022-01-16)


### Code Refactoring

* add `osfingermap` ([e5f9399](https://github.com/saltstack-formulas/node-formula/commit/e5f93992935f2179d2aa857c75277a59766e3f5c))


### Features

* **tumbleweed:** update version via. new `oscodenamemap` ([3ce9ef2](https://github.com/saltstack-formulas/node-formula/commit/3ce9ef2c6cb694e6f2da6f044ffc47a81145ad93))

# [2.1.0](https://github.com/saltstack-formulas/node-formula/compare/v2.0.0...v2.1.0) (2022-01-14)


### Continuous Integration

* **kitchen+ci:** update with `3004` pre-salted images/boxes [skip ci] ([29a797a](https://github.com/saltstack-formulas/node-formula/commit/29a797a8d609a87442c757f876b16f522a45b723))


### Features

* **repo:** update installation `version` [skip ci] ([4902faf](https://github.com/saltstack-formulas/node-formula/commit/4902faff4402034e226dca966f8fd94bb30c7c39))
* **repo:** update installation version ([cad52df](https://github.com/saltstack-formulas/node-formula/commit/cad52dfa08aa54f5bfd51badfdb225c874d1e532))

# [2.0.0](https://github.com/saltstack-formulas/node-formula/compare/v1.1.1...v2.0.0) (2021-11-12)


### Bug Fixes

* **package:** use correct version parameter with packages ([6ce8259](https://github.com/saltstack-formulas/node-formula/commit/6ce8259a4ec8ba715cf4fb2923f7bfc3b5a02ebc))


### BREAKING CHANGES

* **package:** `node:pkg:version` needs to be specified as the
full version number (ie, 16.13.0) instead of just the major number
in order to be able to properly install using packages and pin the
desired version.

## [1.1.1](https://github.com/saltstack-formulas/node-formula/compare/v1.1.0...v1.1.1) (2021-10-27)


### Bug Fixes

* **package:** remove double colon on pillar item ([6049849](https://github.com/saltstack-formulas/node-formula/commit/60498496a9b3f1e59f8c32fa613ce4157ab82fbd))


### Code Refactoring

* **jinja:** remove on due date ([eddad91](https://github.com/saltstack-formulas/node-formula/commit/eddad9170a1bc1a5be7caee45599c2a84dff53a3))

# [1.1.0](https://github.com/saltstack-formulas/node-formula/compare/v1.0.1...v1.1.0) (2021-10-26)


### Bug Fixes

* **debian:** allow version to be user-provided, don't force v13 ([9b1eb68](https://github.com/saltstack-formulas/node-formula/commit/9b1eb68fe2002f556fad27acb5c055e730b5509e))
* **debian:** don't include comps in name and in comps, comps is string ([becd5ba](https://github.com/saltstack-formulas/node-formula/commit/becd5baed5b099cab985ce9b0ea4e65c37feda43))
* **debian:** don't rely on pillar.get, build repo.name when needed ([67a3dda](https://github.com/saltstack-formulas/node-formula/commit/67a3dda9b3f00d0b9febf36fba50022f56225fe6))


### Continuous Integration

* **3003.1:** update inc. AlmaLinux, Rocky & `rst-lint` [skip ci] ([b47573e](https://github.com/saltstack-formulas/node-formula/commit/b47573e4ffca9b7f717a9cd942b0e09482fc6907))
* **gemfile+lock:** use `ssf` customised `inspec` repo [skip ci] ([426bf1e](https://github.com/saltstack-formulas/node-formula/commit/426bf1ef3bd640ddfae1e0f2c45950b3f9945bf3))
* **kitchen:** move `provisioner` block & update `run_command` [skip ci] ([a40e1e8](https://github.com/saltstack-formulas/node-formula/commit/a40e1e83fb699b826aaebb2ab6e8b6ac4261fd45))
* **kitchen+ci:** update with latest `3003.2` pre-salted images [skip ci] ([e60311b](https://github.com/saltstack-formulas/node-formula/commit/e60311be2f08a6feedb1a4841bbeb3b2e043d3ba))
* **kitchen+ci:** update with latest CVE pre-salted images [skip ci] ([0c485e2](https://github.com/saltstack-formulas/node-formula/commit/0c485e2146c24b8da612b25493024ace2d19560d))
* add `arch-master` to matrix and update `.travis.yml` [skip ci] ([922e34d](https://github.com/saltstack-formulas/node-formula/commit/922e34db71046d3b2fcabc34b216d941fb780bd9))
* add Debian 11 Bullseye & update `yamllint` configuration [skip ci] ([25d4626](https://github.com/saltstack-formulas/node-formula/commit/25d46263bc5a7c22a221dab3853c65300774f51e))
* **commitlint:** ensure `upstream/master` uses main repo URL [skip ci] ([c7e7957](https://github.com/saltstack-formulas/node-formula/commit/c7e795783b5d158352857f276bdb86f8658617b5))
* **gemfile+lock:** use `ssf` customised `kitchen-docker` repo [skip ci] ([a099234](https://github.com/saltstack-formulas/node-formula/commit/a099234a08e217c495b4ce770e2d1ce2e329958e))
* **gitlab-ci:** add `rubocop` linter (with `allow_failure`) [skip ci] ([ae1484a](https://github.com/saltstack-formulas/node-formula/commit/ae1484aa4032cf54ea48fdbd3d014b1ae718a34c))
* **kitchen+ci:** use latest pre-salted images (after CVE) [skip ci] ([490ccb2](https://github.com/saltstack-formulas/node-formula/commit/490ccb2aa9fd6fbcc73ed0f021b3a277b125c08b))
* **kitchen+gitlab:** adjust matrix to add `3003` [skip ci] ([6138902](https://github.com/saltstack-formulas/node-formula/commit/6138902f6862a19f14da2c3b01573816f0fde8d4))
* **kitchen+gitlab:** remove Ubuntu 16.04 & Fedora 32 (EOL) [skip ci] ([75dde65](https://github.com/saltstack-formulas/node-formula/commit/75dde65eb76f086665fc76bd90e8eb8bd51d0eb6))
* **kitchen+gitlab-ci:** use latest pre-salted images [skip ci] ([8f864c1](https://github.com/saltstack-formulas/node-formula/commit/8f864c1d6d85e7094b2e8d151905d7ec302f6073))
* **pre-commit:** update hook for `rubocop` [skip ci] ([fdb19f4](https://github.com/saltstack-formulas/node-formula/commit/fdb19f437563c534105cb7c1c2c515686cbcbb0f))


### Documentation

* **readme:** fix headings [skip ci] ([49e05b5](https://github.com/saltstack-formulas/node-formula/commit/49e05b51f97ad296de455876eeb6f364d206eead))


### Features

* **suse:** update installation from `nodejs10` => `nodejs14` [skip ci] ([bf107ff](https://github.com/saltstack-formulas/node-formula/commit/bf107ff537e120df4a10d50335b9a452a1d7508e))


### Tests

* standardise use of `share` suite & `_mapdata` state [skip ci] ([42f8881](https://github.com/saltstack-formulas/node-formula/commit/42f888114407dcde97e684566a474817f7a89aac))

## [1.0.1](https://github.com/saltstack-formulas/node-formula/compare/v1.0.0...v1.0.1) (2020-12-16)


### Continuous Integration

* **gitlab-ci:** use GitLab CI as Travis CI replacement ([88cc5e4](https://github.com/saltstack-formulas/node-formula/commit/88cc5e4f8176f9c61f3aa67ae278a6356b017155))
* **kitchen:** use `saltimages` Docker Hub where available [skip ci] ([4c4c93a](https://github.com/saltstack-formulas/node-formula/commit/4c4c93aa3904de698f55d4db1b55f7bfa8a3ee06))
* **pre-commit:** add to formula [skip ci] ([5c6ac84](https://github.com/saltstack-formulas/node-formula/commit/5c6ac846426ed63d107d5e26c9b6f7723c9d0d89))
* **pre-commit:** enable/disable `rstcheck` as relevant [skip ci] ([65d4b7b](https://github.com/saltstack-formulas/node-formula/commit/65d4b7ba353d52b9f5ec2db865c5f77d4e319d8a))
* **pre-commit:** finalise `rstcheck` configuration [skip ci] ([f4009a0](https://github.com/saltstack-formulas/node-formula/commit/f4009a06a8db3e017b3c3df0b0d527e670e9e911))


### Styles

* **libtofs.jinja:** use Black-inspired Jinja formatting [skip ci] ([1f0a3d2](https://github.com/saltstack-formulas/node-formula/commit/1f0a3d2c0eb25e31e22d66e8388787050f13a381))

# [1.0.0](https://github.com/saltstack-formulas/node-formula/compare/v0.14.2...v1.0.0) (2020-06-01)


### Continuous Integration

* **kitchen+travis:** add new platforms [skip ci] ([60239d4](https://github.com/saltstack-formulas/node-formula/commit/60239d44a5406a28b9e84423d66d0c6f71637b2d))
* **kitchen+travis:** adjust matrix to add `3000.3` [skip ci] ([3527bc5](https://github.com/saltstack-formulas/node-formula/commit/3527bc5597dc767fb93c462e90654404e18a29ee))


### Features

* **formula:** store macros.jinja in subdir ([277d617](https://github.com/saltstack-formulas/node-formula/commit/277d617f97bbfce1ceb349cedc60b0b8f329ae6a))


### BREAKING CHANGES

* **formula:** Major refactor of formula to bring it in alignment with the
`template-formula`.  As with all substantial changes, please ensure your
existing configurations work in the ways you expect from this formula.

## [0.14.2](https://github.com/saltstack-formulas/node-formula/compare/v0.14.1...v0.14.2) (2020-05-02)


### Bug Fixes

* **config/file:** use `|tojson` (was failing on Arch `2019.2`) ([032abda](https://github.com/saltstack-formulas/node-formula/commit/032abda3626ec69023eec480f75e6ad552ecd180))


### Continuous Integration

* **kitchen+travis:** adjust matrix to add `3000.2` & remove `2018.3` ([21dc1c9](https://github.com/saltstack-formulas/node-formula/commit/21dc1c928f894aeb87fdda451f5e51442ef57793))

## [0.14.1](https://github.com/saltstack-formulas/node-formula/compare/v0.14.0...v0.14.1) (2020-04-15)


### Bug Fixes

* **osfamilymap:** use correct package for `Suse` ([d8a8264](https://github.com/saltstack-formulas/node-formula/commit/d8a8264ccaea147b65049b2cc9bd8473d1a74ebc))


### Continuous Integration

* **travis:** update matrix to test across all platforms ([f923134](https://github.com/saltstack-formulas/node-formula/commit/f923134e0292cacc9a2478e8d92c0f48788a6d1f))

# [0.14.0](https://github.com/saltstack-formulas/node-formula/compare/v0.13.2...v0.14.0) (2020-04-13)


### Bug Fixes

* **cleanup:** tidyup few loose ends ([febeb4c](https://github.com/saltstack-formulas/node-formula/commit/febeb4cea1c1a92f185f8e533f3181c754f59c2a))


### Features

* **template:** align to template formula ([2570563](https://github.com/saltstack-formulas/node-formula/commit/2570563e4734b6c54c07ebd1091efa7578589009))
