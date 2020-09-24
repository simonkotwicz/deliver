FROM alpine:latest

WORKDIR /root
RUN apk add --no-cache bash coreutils git docker curl && \
    # kubectl
    KUBECTL_VERSION=$(curl -fsSL https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    curl -fsSL https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    # helm
    HELM_VERSION=v3.3.4 && \
    curl -fsSL https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz | tar -xz && \
    mv linux-amd64/helm /bin/helm && rm -rf linux-amd64

COPY . /deliver