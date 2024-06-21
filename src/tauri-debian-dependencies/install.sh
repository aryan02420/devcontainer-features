#!/bin/sh
set -e

export TAURI_VERSION="${TAURIVERSION:-"latest"}"

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi


if [ "${TAURI_VERSION}" == "1" ]; then
    apt-get update
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        libwebkit2gtk-4.0-dev \
        build-essential \
        curl \
        wget \
        file \
        libssl-dev \
        libgtk-3-dev \
        libayatana-appindicator3-dev \
        librsvg2-dev
fi

if [ "${TAURI_VERSION}" == "2" ] || [ "${TAURI_VERSION}" == "latest" ]; then
    apt-get update
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        libwebkit2gtk-4.1-dev \
        build-essential \
        curl \
        wget \
        file \
        libxdo-dev \
        libssl-dev \
        libayatana-appindicator3-dev \
        librsvg2-dev
fi
