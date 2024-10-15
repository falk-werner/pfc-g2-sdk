#!/bin/bash

set -e

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"

cd "${SCRIPT_DIR}/pfc-firmware-sdk-g2/ptxproj"

ptxdist select configs/wago-pfcXXX/ptxconfig_pfc_g2
ptxdist platform configs/wago-pfcXXX/platformconfig
ptxdist toolchain /opt/gcc-Toolchain-2022.08-wago.1/LINARO.Toolchain-2022.08-wago.1/arm-linux-gnueabihf/bin/
