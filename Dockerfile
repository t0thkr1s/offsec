# docker build -t pentest .
# docker run --rm -v $PWD:/shared --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name pentest -i pentest
# docker exec -it pentest /usr/bin/fish

FROM kalilinux/kali-rolling
ENV LC_CTYPE C.UTF-8
RUN apt update && apt full-upgrade -y && \
apt install -y fish neovim nmap nikto smbclient ruby-dev john foremost hashcat hydra gobuster dirb wpscan exploitdb build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip && \
pip3 install requests capstone pwntools keystone-engine unicorn capstone ropper && \
chsh -s /usr/bin/fish && \
gem install evil-winrm && \
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh && \
cd /opt && git clone https://github.com/SecureAuthCorp/impacket.git && cd impacket/ && python3 setup.py install