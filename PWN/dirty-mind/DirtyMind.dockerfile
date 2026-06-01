FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y asterisk sudo openssh-server && \
    rm -rf /var/lib/apt/lists/*

# Create SSH directory
RUN mkdir /var/run/sshd
RUN ssh-keygen -A

# Create a low-priv user
RUN useradd -m dirtymind && echo "dirtymind:butthole" | chpasswd

RUN echo "Nice Butt. (_*_)" > /etc/issue.net

# Allow password login (intentionally weak for CTF)
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config


# Intentionally insecure permissions
RUN chmod 777 /var/run/asterisk || true

# Populate Local
RUN mkdir -p /home/dirtymind/Desktop/WIPs
RUN mkdir -p /home/dirtymind/Desktop/ShowerThoughts
RUN echo "I can't tell if I like guy and gals. Maybe both!?" > /home/dirtymind/Desktop/ShowerThoughts/30_04_2026.txt
RUN echo "I can't decide if I like cucumbers or peaches more. I like that peaches are fuzzy but I can't go to the hospital again." > /home/dirtymind/Desktop/ShowerThoughts/30_05_2026.txt
RUN echo "I should start a dating app, but my basement doesn't have much space for a server. I could rent one? Pitch, OnlyCats. Match people based on what cat they own." > /home/dirtymind/Desktop/ShowerThoughts/30_06_2026.txt
RUN echo "How big is too big?" > /home/dirtymind/Desktop/ShowerThoughts/30_01_2026.txt

# Populate Root
RUN mkdir -p /root/MyCollection
COPY memes/ -p /root/MyCollection/

# Optional flag
RUN echo "LTDH2026{*ASSterisk_3scape*}" > /root/MyCollection/hole.txt
# Small attempt to hide under false file type
RUN mv /root/hole.txt /root/hole.jpg

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start SSH and Asterisk
CMD ["/start.sh"]
