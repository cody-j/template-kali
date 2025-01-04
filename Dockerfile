FROM kalilinux/kali-rolling

# Update and install essential tools
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    kali-tools-top10 \
    python3 \
    python3-pip \
    git \
    vim \
    curl \
    wget \
    nmap \
    netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /root

# Create tools directory
RUN mkdir -p /root/tools

# Set up Python environment
# RUN python3 -m pip install --upgrade pip
# RUN pip3 install requests scapy python-nmap

# Optional: Add your custom tools or scripts here
# COPY ./scripts /root/tools/

# Set environment variables
ENV TERM=xterm

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["/bin/bash"]

