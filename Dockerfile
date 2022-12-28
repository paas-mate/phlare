FROM shoothzj/base

WORKDIR /opt/phlare

ARG TARGETARCH

RUN wget https://github.com/grafana/phlare/releases/download/v0.1.1/phlare_0.1.1_linux_$TARGETARCH.zip  && \
    unzip phlare-linux-$TARGETARCH.zip && \
    mv phlare-linux-$TARGETARCH phlare && \
    rm -rf phlare-linux-$TARGETARCH.zip

ENV PHLARE_HOME=/opt/phlare

ENTRYPOINT ["/opt/phlare/phlare"]
CMD ["-config.file=/opt/phlare/config/config.yml"]
