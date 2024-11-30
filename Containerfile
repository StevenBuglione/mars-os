ARG SOURCE_IMAGE="bluefin"
ARG SOURCE_SUFFIX="-dx-nvidia"
ARG SOURCE_TAG="latest"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}

COPY scripts /scripts
COPY --from=ghcr.io/blue-build/modules/bling:latest /modules/bling/installers/1password.sh /scripts/1password.sh

RUN /scripts/00_prepare.sh && \
    /scripts/20_install.sh && \
    /scripts/30_configure.sh && \
    /scripts/90_finalize.sh && \
    ostree container commit