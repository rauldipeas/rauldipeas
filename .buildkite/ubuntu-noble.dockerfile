#FROM docker.io/buildkite/hosted-agent-base:ubuntu-v1.0.1@sha256:f1378abd34fccb2b7b661aaf3b06394509a4f7b5bb8c2f8ad431e7eaa1cabc9c
RUN apt update
RUN sudo apt install -y wget
RUN wget -O- https://debian.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/debian.griffo.io.gpg
RUN printf "deb https://debian.griffo.io/apt %s main\n" "$(lsb_release -sc)" | sudo tee /etc/apt/sources.list.d/debian.griffo.io.list
RUN printf 'deb [trusted=yes] https://cli.gemfury.com/apt/ /' | sudo tee /etc/apt/sources.list.d/fury-cli.list
RUN apt update
RUN apt install -y bc bison build-essential debhelper devscripts flex gemfury kmod libdw-dev libelf-dev liblz4-tool libssl-dev wget zig
RUN sed -i 's/jammy/noble/g' /etc/apt/sources.list
RUN apt update
RUN apt install -y g++-13 gcc-13
RUN wget "$(curl -sSL "https://api.github.com/repos/mihaigalos/aim/releases/latest" | grep browser_download_url | grep "aim_.*amd64.deb" | head -n1 | cut -d \" -f4)"
RUN wget "$(curl -sSL "https://api.github.com/repos/devmatteini/dra/releases/latest" | grep browser_download_url | grep "amd64.deb" | head -n1 | cut -d \" -f4)"
RUN wget "$(curl -s http://ftp.debian.org/debian/pool/main/d/debian-archive-keyring/ | grep -oP 'debian-archive-keyring_[0-9.]+_all\.deb' | sort -V | tail -1 | sed 's|^|http://ftp.debian.org/debian/pool/main/d/debian-archive-keyring/|')"
RUN apt install -y "$PWD"/*.deb
RUN rm "$PWD"/*.deb