FROM alpine:latest

ENV MKDOCS_VERSION="1.0.4" \
    GIT_REPO='false' \
    LIVE_RELOAD_SUPPORT='false'

RUN \
    apk add --update \
        ca-certificates \
        bash \
        git \
        openssh \
        python2 \
        python2-dev \
        py-setuptools; \
    easy_install-2.7 pip && \
    pip install mkdocs==${MKDOCS_VERSION} && \
    pip install mkdocs-material && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY container-files/scripts /

WORKDIR /workdir

ENTRYPOINT ["/bootstrap.sh"]
