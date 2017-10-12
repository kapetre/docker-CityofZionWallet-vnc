FROM ubuntu:16.04
RUN apt update && \
    apt install -y x11vnc xvfb wget libasound2

WORKDIR /tmp
RUN wget https://github.com/CityOfZion/neon-wallet/releases/download/0.0.6/Linux.Neon_0.0.6_amd64.deb

# Verify sha256sum from https://github.com/CityOfZion/neon-wallet/releases 
# Expected: /Linux.Neon_0.0.6_amd64.deb 5661a9ffad2c3a8c6ff24d960e8acfd288ebca6527621c56b8a1808e2285266a
RUN sha256sum /tmp/Linux.Neon_0.0.6_amd64.deb

RUN apt-get install -f /tmp/Linux.Neon_0.0.6_amd64.deb -y

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd neo123 ~/.vnc/passwd

RUN bash -c 'echo "neon" >> ~/.bashrc'

EXPOSE 5900

CMD [ "x11vnc", "-forever", "-usepw", "-create" ]

