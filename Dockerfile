FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install -y \
    man-db \
    manpages \
    manpages-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    kali-tools-top10 \
    kali-tools-forensics \
    kali-tools-web \
    python3-pip \
    git \
    vim \
    tmux \
    gdb \
    radare2 \
    gobuster \
    wordlists \
    steghide \
    binwalk \
    foremost \
    john \
    hashcat \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# RUN apt-get install python3 python3-pip python3-dev libffi-dev build-essential
# RUN python3 -m pip install --upgrade pip
# RUN python3 -m pip install --upgrade pwntools


WORKDIR /root

RUN mkdir -p /root/ctf /root/tools /root/wordlists

RUN git clone https://github.com/danielmiessler/SecLists /root/wordlists/SecLists
RUN git clone https://github.com/swisskyrepo/PayloadsAllTheThings /root/tools/PayloadsAllTheThings

RUN mandb
ENV TERM=xterm-256color

VOLUME ["/root/ctf", "/root/tools"]

SHELL ["/bin/bash", "-c"]

CMD ["/bin/bash"]

