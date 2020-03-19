FROM ubuntu:rolling
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root
RUN apt update && apt full-upgrade -y && \
apt install -y neovim wget radare2 curl nmap ncat php ftp binwalk inetutils-ping build-essential golang jq strace ltrace gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip && \
pip3 install requests capstone pwntools keystone-engine unicorn capstone ropper ropgadget && \
apt autoremove && apt autoclean && rm -rf /var/lib/apt/lists/* && \
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh