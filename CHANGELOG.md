# Changelog

## [2.0.0](https://github.com/extra2000/podman-formula/compare/v1.1.5...v2.0.0) (2020-10-17)


### ⚠ BREAKING CHANGES

* `podman-compose` have been removed. Please use rootless Podman Pod.

### Code Refactoring

* Remove `podman-compose` ([abc4b9f](https://github.com/extra2000/podman-formula/commit/abc4b9fbb3102bc4c1acb6c7c2445b22e000d65c))

### [1.1.5](https://github.com/extra2000/podman-formula/compare/v1.1.4...v1.1.5) (2020-10-17)


### Fixes

* **config.selinux.podman:** Fix rootless container unable to mount host files ([3fef78f](https://github.com/extra2000/podman-formula/commit/3fef78f8f5212ce4dde6416a22cf3080f8d85e1c))

### [1.1.4](https://github.com/extra2000/podman-formula/compare/v1.1.3...v1.1.4) (2020-10-04)


### Continuous Integrations

* **semantic-release:** Fix patch updates with BREAKING CHANGE doesn't trigger major release ([b3a5e30](https://github.com/extra2000/podman-formula/commit/b3a5e30690473fafed05332415d050aaf94bf308))

### [1.1.3](https://github.com/extra2000/podman-formula/compare/v1.1.2...v1.1.3) (2020-10-02)


### Continuous Integrations

* **semantic-release:** Add fix type ([e7d4bc6](https://github.com/extra2000/podman-formula/commit/e7d4bc661db733bfb1a162615b80794195ad241e))

### [1.1.2](https://github.com/extra2000/podman-formula/compare/v1.1.1...v1.1.2) (2020-10-02)


### Code Refactoring

* **package.install:** Remove humanname ([c02a816](https://github.com/extra2000/podman-formula/commit/c02a816a96a2b46087472e4ab0fbcf1300899faa))


### Maintenance

* **release:** 1.1.2-beta.1 [skip ci] ([065e79c](https://github.com/extra2000/podman-formula/commit/065e79c32e0d9ab545bd9d5e5280a849d499d844))

### [1.1.2-beta.1](https://github.com/extra2000/podman-formula/compare/v1.1.1...v1.1.2-beta.1) (2020-10-02)


### Code Refactoring

* **package.install:** Remove humanname ([c02a816](https://github.com/extra2000/podman-formula/commit/c02a816a96a2b46087472e4ab0fbcf1300899faa))

### [1.1.1](https://github.com/extra2000/podman-formula/compare/v1.1.0...v1.1.1) (2020-10-01)


### Continuous Integrations

* **semantic-release:** Add rc, beta, and alpha release channels ([ed3bd8e](https://github.com/extra2000/podman-formula/commit/ed3bd8e1196c8721aa7bd65038c838ebebb37d3e))
* **semantic-release:** Remove invalid release branches ([70f45c4](https://github.com/extra2000/podman-formula/commit/70f45c4d956bbd9aaa02f8bcdff4439802c2d5bb))
* **semantic-release:** Remove README scope from docs ([fff7058](https://github.com/extra2000/podman-formula/commit/fff7058eb8f6f83a5844b03b97e539e095a5d441))


### Documentations

* **README:** Add available states ([7993ac6](https://github.com/extra2000/podman-formula/commit/7993ac6d133062006e7773f9e8e8c19388e0dd7e))
* **README:** Add badges ([1d2a0e6](https://github.com/extra2000/podman-formula/commit/1d2a0e669d6290594edd186e9684834e7500acc9))
* **README:** Update descriptions ([c0d37ff](https://github.com/extra2000/podman-formula/commit/c0d37ff5de44ad27f9000bbe009443d1b29ce567))

## [1.1.0](https://github.com/extra2000/podman-formula/compare/v1.0.2...v1.1.0) (2020-09-30)


### Features

* **podman:** Add rootless podman support ([0105662](https://github.com/extra2000/podman-formula/commit/01056629bd7fe66e0f64a9523d1c7e3fefb26700))

### [1.0.2](https://github.com/extra2000/podman-formula/compare/v1.0.1...v1.0.2) (2020-09-28)

### [1.0.1](https://github.com/extra2000/podman-formula/compare/v1.0.0...v1.0.1) (2020-09-27)


### Continuous Integrations

* **travis:** Add Slack notifications ([8dd6dbe](https://github.com/extra2000/podman-formula/commit/8dd6dbe4de2e363d6e84cd21f5989e2aff7bae67))
* Add Travis CI and semantic-release ([57d00f0](https://github.com/extra2000/podman-formula/commit/57d00f08713ca6b8aec55a6eedeaf5e3fb40b7c9))
