FROM kalilinux/kali-rolling
ENV LC_CTYPE C.UTF-8
WORKDIR /root
COPY wordlists.zip .
RUN apt update && apt full-upgrade -y && \
apt install -y fish neovim nmap ncat nikto smbclient smbmap snmp php steghide fcrackzip aircrack-ng sqlmap ruby-dev ftp foremost apktool exiftool metasploit-framework binwalk hashcat hydra inetutils-ping gobuster dirb wpscan exploitdb build-essential golang jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip && \
pip3 install requests capstone pwntools keystone-engine unicorn capstone ropper && \
apt autoremove && apt autoclean && rm -rf /var/lib/apt/lists/* && \
unzip wordlists.zip && rm wordlists.zip && \
chsh -s /usr/bin/fish && \
gem install evil-winrm && \
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh && \
mkdir tools && cd tools && \
git clone https://github.com/SecureAuthCorp/impacket.git && cd impacket && python3 setup.py install && cd .. && \
git clone https://github.com/ffuf/ffuf && \
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite peas && \
git clone https://github.com/DominicBreuker/pspy && \
git clone https://github.com/rebootuser/LinEnum linenum && \
git clone https://github.com/magnumripper/JohnTheRipper john && cd john/src && ./configure && make -s clean && make -sj4