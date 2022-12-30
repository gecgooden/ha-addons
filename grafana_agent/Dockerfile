ARG BUILD_FROM
ARG GRAFANA_AGENT_VERSION=v0.30.1
FROM grafana/agent:$GRAFANA_AGENT_VERSION as builder

FROM $BUILD_FROM
ARG BUILD_ARCH

COPY --from=builder /usr/bin/agent /usr/bin/agent
RUN apk add libc6-compat
# RUN \
#     ARCH="${BUILD_ARCH}" \
#     && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
#     && curl -sSLf -O \
#         "https://github.com/grafana/agent/releases/download/${GRAFANA_AGENT_VERSION}/agent-linux-${ARCH}.zip" \
#     && unzip "agent-linux-${ARCH}.zip" \
#     && mv "agent-linux-${ARCH}" /usr/bin/agent \
#     && chmod a+x /usr/bin/agent

COPY run.sh /
RUN chmod a+x /run.sh
COPY rootfs /

CMD [ "/run.sh" ]