FROM ubuntu:22.04
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root

# Update and install packages
RUN apt update && apt full-upgrade -y && \
    # Install core dependencies first
    apt install -y \
    software-properties-common \
    curl \
    wget \
    git && \
    # Fix potential package issues
    apt --fix-broken install -y && \
    # Install remaining packages
    apt install -y \
    neovim \
    jq \
    make \
    procps \
    radare2 \
    nmap \
    ncat \
    ftp \
    binwalk \
    inetutils-ping \
    dnsutils \
    netcat \
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
    python3-distutils \
    libssl-dev \
    libffi-dev \
    libpcre3-dev \
    libdb-dev \
    libxt-dev \
    libxaw7-dev \
    php && \
    # Install pip using get-pip.py method to avoid conflicts
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3 && \
    # Install Python packages
    python3 -m pip install \
    requests \
    capstone \
    pwntools \
    keystone-engine \
    unicorn \
    ropper \
    ropgadget && \
    # Clean up
    apt autoremove -y && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    # Install GEF
    wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Set Python3 as default python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Create working directory for projects
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
