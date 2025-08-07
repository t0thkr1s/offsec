FROM ubuntu:22.04
ENV LC_CTYPE=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root

# Update and install all packages
RUN apt update && apt full-upgrade -y && \
    apt install -y \
    curl wget git neovim jq make procps \
    nmap ftp binwalk inetutils-ping dnsutils \
    netcat-traditional net-tools build-essential \
    golang gcc gcc-multilib gdb gdb-multiarch \
    strace ltrace php python3 python3-dev \
    python3-venv python3-pip libssl-dev \
    libffi-dev libpcre3-dev libdb-dev \
    libxt-dev libxaw7-dev ca-certificates

# Install Python packages using apt's pip3
RUN python3 -m pip install --break-system-packages \
    requests capstone pwntools keystone-engine \
    unicorn ropper ropgadget || \
    python3 -m pip install \
    requests capstone pwntools keystone-engine \
    unicorn ropper ropgadget

# Clean up and install GEF
RUN apt autoremove -y && apt autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Set Python3 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

WORKDIR /workspace
CMD ["/bin/bash"]
