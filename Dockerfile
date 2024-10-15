FROM wagoautomation/sdk-builder:3.0.0 AS builder

WORKDIR /
ENTRYPOINT [ "bash" ]
RUN rm -rf /home/user

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y --no-install-recommends \
    locales \
    git \
    git-lfs

RUN git lfs install

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME
RUN useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

FROM builder AS buildrun

USER user

COPY --chown=user:user . /home/user/ptxproj

WORKDIR /home/user/ptxproj

RUN ptxdist toolchain /opt/gcc-Toolchain-2022.08-wago.1/LINARO.Toolchain-2022.08-wago.1/arm-linux-gnueabihf/bin/
RUN ptxdist select configs/wago-pfcXXX/ptxconfig_pfc_g2
RUN ptxdist platform configs/wago-pfcXXX/platformconfig
RUN ptxdist clean -q

RUN ptxdist images -q -j -n19
RUN make wup

FROM scratch AS build

COPY --from=buildrun /home/user/ptxproj/platform-wago-pfcXXX/images /images
COPY --from=buildrun /home/user/ptxproj/platform-wago-pfcXXX/packages/*.ipk /packages/

FROM builder AS devcontainer
