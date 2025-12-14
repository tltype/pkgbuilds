# PKGBUILDs

## Build a single package

Use the path of the package: `kupferboostrap packages build main/base-kupfer`

## Build all packages

`kupferbootstrap packages build all`

## Overview of my repository

1. Pulls the [Kupfer official pkgbuilds](https://gitlab.com/kupfer/packages/pkgbuilds/-/blob/55772c28cec2c2761553679be42f5c3767613126) and merges these following directories from [selcarpa/arch4elish-pkgbuilds](https://github.com/selcarpa/arch4elish-pkgbuilds/tree/f6a02af21223c70a4c16350238ee695b6df556fa) into the corresponding locations in the Kupfer official pkgbuilds.

```
device/device-sm8250-xiaomi-elish

device/device-sm8250-common

firmware/sm8250-xiaomi-elish

linux/sm8250

```

2. Update the linux firmware to version 20251125.

```
firmware/linux/PKGBUILD:

pkgver=20250708 --> pkgver=20251125

source=("https://gitlab.com/kernel-firmware/linux-firmware/-/archive/${pkgver}/linux-firmware-${pkgver}.tar.gz") --> source=("https://kernel.org/pub/linux/kernel/firmware/linux-firmware-${pkgver}.tar.gz")

sha256sums=(...) # Change to linux-firmware-20251125.tar.gz

_folders="qcom qca ath10k" --> _folders="qcom qca ath10k ath11k"

```

3. Update the upstream [lujianhua/xiaomi-elish-firmware](https://github.com/lujianhua/xiaomi-elish-firmware/tree/51e9ac8cd91d88de43fb016530b9421a2713467a) repository.

```
firmware/sm8250-xiaomi-elish/PKGBUILD:

_commit="..." # Change to latest commit

sha256sums=(...) # Change to latest commit

```

4. Sync with the upstream [linux kernel 6.11.0](https://gitlab.com/postmarketOS/pmaports/-/blob/ed6f5f38b373962216b0dd96e0db7db0f8cf338f/device/testing/linux-postmarketos-qcom-sm8250)

```
linux/sm8250/PKGBUILD:

pkgver=6.9.0 --> pkgver=6.11.0

pkgrel=1 --> pkgrel=0

makedepends=(xmlto docbook-xsl kmod inetutils bc dtc cpio) --> makedepends=(xmlto docbook-xsl kmod inetutils bc dtc cpio python3)

_commit="..." # Change to 6.11.0 latest commit

_config_commit="..." # Change to latest commit

sha256sums=(...) # Change to latest commit

```

5. deviceinfo

```
device/device-sm8250-xiaomi-elish/PKGBUILD:

# Although deviceinfo is almost impossible to update, the following options have been added just in case.
# source=(
#     "https://gitlab.postmarketos.org/postmarketOS/pmaports/-/raw/${_commit}/device/community/device-xiaomi-elish/deviceinfo"
#     machine-info
#     xiaomi-elish.conf
# )

```

6. Addition of architecture support for cross-compilation libraries. This adjustment was made due to recurring errors encountered during compilation related to `cross/aarch64-unknown-linux-gnu-bin` and `cross/arm-unknown-linux-gnueabihf-bin` not supporting the aarch64 architecture. If you do not encounter such issues, it is recommended to retain the original configuration.

```
cross/aarch64-unknown-linux-gnu-bin/PKGBUILD and cross/arm-unknown-linux-gnueabihf-bin/PKGBUILD:

arch=(x86_64) --> arch=(x86_64 armv5 armv6h armv7h aarch64 i686)

```
