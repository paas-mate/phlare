FROM shoothzj/base

WORKDIR /opt/phlare

ARG TARGETARCH

RUN wget -q https://github.com/grafana/phlare/releases/download/v0.1.1/phlare_0.1.1_linux_$TARGETARCH.tar.gz  && \
    mkdir -p phlare && \
    tar -xf phlare_0.1.1_linux_$TARGETARCH.tar.gz -C /opt/phlare && \
    rm -rf phlare_0.1.1_linux_$TARGETARCH.tar.gz

ENV PHLARE_HOME=/opt/phlare

ENTRYPOINT ["/opt/phlare/phlare"]
CMD ["-config.file=/opt/phlare/config/config.yml"]
