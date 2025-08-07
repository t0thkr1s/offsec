FROM ubuntu:rolling
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root

# Update package lists and upgrade system
RUN apt update && apt full-upgrade -y && \
    # Install core dependencies
    apt install -y \
    # Editors and utilities
    neovim wget curl jq git make procps \
    # Security and network tools  
    radare2 nmap ncat ftp binwalk inetutils-ping dnsutils netcat net-tools \
    # Development tools
    build-essential golang gcc gcc-multilib \
    # Debugging tools
    gdb gdb-multiarch strace ltrace \
    # Python and development libraries
    python3 python3-pip python3-dev python3-venv \
    # Additional development libraries
    libssl-dev libffi-dev libpcre3-dev libdb-dev libxt-dev libxaw7-dev \
    # Web development
    php && \
    # Install Python packages using pip3
    pip3 install --break-system-packages \
    requests capstone pwntools keystone-engine unicorn ropper ropgadget && \
    # Clean up package cache
    apt autoremove -y && apt autoclean && rm -rf /var/lib/apt/lists/* && \
    # Install GEF (GDB Enhanced Features)
    wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Set Python3 as default python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Create working directory for projects
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]
