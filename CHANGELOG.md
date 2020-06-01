# Changelog

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
