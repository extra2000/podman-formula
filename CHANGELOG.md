# Changelog

### [3.0.1](https://github.com/extra2000/podman-formula/compare/v3.0.0...v3.0.1) (2021-05-03)


### Documentations

* **README:** Add how to install Podman from Kubic repository for Debian 10 ([c22a4a5](https://github.com/extra2000/podman-formula/commit/c22a4a5dfa07f6514a08620cf47ce4b02fe86e6f))
* **README:** Remove `systemctl --user daemon-reload` ([980a937](https://github.com/extra2000/podman-formula/commit/980a937c399c58b1a458f07d78d3e5ff3ef533fc))

## [3.0.0](https://github.com/extra2000/podman-formula/compare/v2.2.2...v3.0.0) (2021-05-02)


### ⚠ BREAKING CHANGES

* **rootless,package:** Support for Debian 10 has been dropped
* Pillar structure has changed.

### Styles

* **README:** Add extra spacing before Section `Supported Platforms` ([8ed0bb7](https://github.com/extra2000/podman-formula/commit/8ed0bb7e8d05fcef4872b46eade5d537f151768d))


### Code Refactoring

* **rootless,package:** Refactor `rootless` state and drop support for Debian 10 ([ba6a0a9](https://github.com/extra2000/podman-formula/commit/ba6a0a9c06aab5ce4393b6ab3f2afe62b041e77d))
* Restructure formula according to official SaltStack Formula template ([da0b640](https://github.com/extra2000/podman-formula/commit/da0b64032d9df92ad200a80ca048c38e522befe2))
* **registry:** Remove image registries which is only used by Arch Linux ([38abe02](https://github.com/extra2000/podman-formula/commit/38abe02928f6c04abe72989bf7550108cfc1fad6))


### Documentations

* **README:** Add Raspberry Pi OS (Buster) into Section `Unsupported platforms` and Podman manual instructions ([9b691d8](https://github.com/extra2000/podman-formula/commit/9b691d835c04d2cd27fb8d22e1e4a11ee477ce1d))
* **README:** Move Debian 10 into Section `Unsupported platforms` and add manual Podman instructions for Debian 10 ([6362379](https://github.com/extra2000/podman-formula/commit/6362379b5788133329716908f82a8a1ac96ac68a))

### [2.2.2](https://github.com/extra2000/podman-formula/compare/v2.2.1...v2.2.2) (2021-04-28)


### Fixes

* **rootless:** Enable linger ([2422684](https://github.com/extra2000/podman-formula/commit/24226841082cbb04e6d524008bef8fb56b8f902d))
* **rootless:** Ensure `rootless-cni-infra` is removed on startup ([71db7c2](https://github.com/extra2000/podman-formula/commit/71db7c2be1439a52fc948db0006ca618608c35ab))

### [2.2.1](https://github.com/extra2000/podman-formula/compare/v2.2.0...v2.2.1) (2021-01-20)


### Documentations

* **README:** Add license scan report and status ([297c145](https://github.com/extra2000/podman-formula/commit/297c1455511b447a1ede8926175be293617bff2f))

## [2.2.0](https://github.com/extra2000/podman-formula/compare/v2.1.0...v2.2.0) (2020-11-29)


### Features

* Add support for Arch families ([2247593](https://github.com/extra2000/podman-formula/commit/22475936b24872bee6c0b58726061f27b90469cb))


### Continuous Integrations

* Replace Travis CI with AppVeyor ([91cd858](https://github.com/extra2000/podman-formula/commit/91cd858bdc83254ffad11bf31800d4dcb1087ed6))
* **semantic-release:** Write version to `VERSION.txt` ([a5252e5](https://github.com/extra2000/podman-formula/commit/a5252e5b3f14b68cf65cc2798095d12f31585c83))


### Documentations

* **README:** Add a list of Supported Platforms ([e187b0d](https://github.com/extra2000/podman-formula/commit/e187b0d3fbf53d22e427a687ea877833b76c24b8))


### Maintenance

* **release:** 2.2.0-alpha.1 [skip ci] ([e8e0e87](https://github.com/extra2000/podman-formula/commit/e8e0e87e3442074e7e2f594b928f300fb206cdec))

## [2.2.0-alpha.1](https://github.com/extra2000/podman-formula/compare/v2.1.0...v2.2.0-alpha.1) (2020-11-29)


### Features

* Add support for Arch families ([2247593](https://github.com/extra2000/podman-formula/commit/22475936b24872bee6c0b58726061f27b90469cb))


### Continuous Integrations

* Replace Travis CI with AppVeyor ([91cd858](https://github.com/extra2000/podman-formula/commit/91cd858bdc83254ffad11bf31800d4dcb1087ed6))
* **semantic-release:** Write version to `VERSION.txt` ([a5252e5](https://github.com/extra2000/podman-formula/commit/a5252e5b3f14b68cf65cc2798095d12f31585c83))


### Documentations

* **README:** Add a list of Supported Platforms ([e187b0d](https://github.com/extra2000/podman-formula/commit/e187b0d3fbf53d22e427a687ea877833b76c24b8))

## [2.1.0](https://github.com/extra2000/podman-formula/compare/v2.0.1...v2.1.0) (2020-11-27)


### Features

* Add support for Debian, Ubuntu, and SUSE families ([bbd15ae](https://github.com/extra2000/podman-formula/commit/bbd15ae5bcea214e762e28d1302d55002985acd4))


### Performance Improvements

* Remove unused `dnsname` plugin since rootless Podman doesn't have IP address ([ad40e05](https://github.com/extra2000/podman-formula/commit/ad40e05a4a14ffbad398f2205abf30ff836a0dcf))


### Fixes

* **config.rootless:** Fix `podman system migrate` command stuck on openSUSE Tumbleweed x86_64 ([9fc06a9](https://github.com/extra2000/podman-formula/commit/9fc06a9787d3b33b9b04d58056e22a56be4db434))


### Maintenance

* **release:** 2.0.2-alpha.1 [skip ci] ([334cddb](https://github.com/extra2000/podman-formula/commit/334cddbda4208b7310324c40d14e2e8f331bfcb7))
* **release:** 2.1.0-alpha.1 [skip ci] ([511591a](https://github.com/extra2000/podman-formula/commit/511591a528855816e6b7d2891ffabace519f839a))

## [2.1.0-alpha.1](https://github.com/extra2000/podman-formula/compare/v2.0.2-alpha.1...v2.1.0-alpha.1) (2020-11-04)


### Features

* Add support for Debian, Ubuntu, and SUSE families ([bbd15ae](https://github.com/extra2000/podman-formula/commit/bbd15ae5bcea214e762e28d1302d55002985acd4))


### Fixes

* **config.rootless:** Fix `podman system migrate` command stuck on openSUSE Tumbleweed x86_64 ([9fc06a9](https://github.com/extra2000/podman-formula/commit/9fc06a9787d3b33b9b04d58056e22a56be4db434))

### [2.0.2-alpha.1](https://github.com/extra2000/podman-formula/compare/v2.0.1...v2.0.2-alpha.1) (2020-10-25)


### Performance Improvements

* Remove unused `dnsname` plugin since rootless Podman doesn't have IP address ([ad40e05](https://github.com/extra2000/podman-formula/commit/ad40e05a4a14ffbad398f2205abf30ff836a0dcf))

### [2.0.1](https://github.com/extra2000/podman-formula/compare/v2.0.0...v2.0.1) (2020-10-20)


### Fixes

* **config.rootless:** Fix namespace error when pulling image ([af4276c](https://github.com/extra2000/podman-formula/commit/af4276c8af236169bb5b05c2908f06769531caf6))

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
