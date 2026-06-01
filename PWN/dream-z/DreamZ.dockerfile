FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        cowsay \
        sudo \
        perl \
        openssh-server && \
    ln -s /usr/games/cowthink /usr/bin/cowthink && \
    useradd -m -s /bin/bash Dreamer && \
    echo 'Dreamer:password123!' | chpasswd && \
    echo 'Dreamer ALL=(ALL) NOPASSWD: /usr/bin/cowthink' >> /etc/sudoers && \
    echo 'LTDH26{3lectr1c_Sh33p}' > /root/flag.txt && \
    echo 'Rick awoke before dawn to the hollow muttering of rooftop cattle and wondered whether electric cows dreamed in static fields beneath synthetic stars.' > /home/Dreamer/lost.txt && \
    echo 'The cow was a black and white Holstein, with a bell around its neck and a placard that read "MooSay".' > /home/Dreamer/.cow.txt && \
    mkdir /home/Dreamer/.MooDo && \
    echo 'But it did not speak, and Rick could not understand its thoughts.' >> /home/Dreamer/.MooDo/cow_thoughts.txt && \
    echo 'Rick tried to communicate with the cow, but it only stared at the root of the tree, watching the little flag.txt breeze in the wind.' >> /home/Dreamer/.MooDo/.cow_messages.txt && \
    chmod 600 /root/flag.txt && \
    mkdir /var/run/sshd && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    apt-get clean

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
