FROM ubuntu:22.04
ENV LC_CTYPE=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root

# Update and install all available packages
RUN apt update && apt full-upgrade -y && \
    apt install -y \
    software-properties-common \
    curl \
    wget \
    git \
    neovim \
    jq \
    make \
    procps \
    nmap \
    ftp \
    binwalk \
    inetutils-ping \
    dnsutils \
    netcat-traditional \
    net-tools \
    build-essential \
    golang \
    gcc \
    gcc-multilib \
    gdb \
    gdb-multiarch \
    strace \
    ltrace \
    python3 \
    python3-dev \
    python3-venv \
    libssl-dev \
    libffi-dev \
    libpcre3-dev \
    libdb-dev \
    libxt-dev \
    libxaw7-dev \
    php

# Install pip and Python packages
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3 && \
    python3 -m pip install \
    requests \
    capstone \
    pwntools \
    keystone-engine \
    unicorn \
    ropper \
    ropgadget

# Install radare2 via snap as alternative
RUN apt install -y snapd || echo "Snapd not available" && \
    (snap install radare2 || echo "Radare2 snap installation failed")

# Clean up and install GEF
RUN apt autoremove -y && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Set Python3 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

WORKDIR /workspace
CMD ["/bin/bash"]
