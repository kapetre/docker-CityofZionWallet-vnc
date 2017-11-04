FROM ubuntu:16.04
RUN apt update && \
    apt install -y x11vnc xvfb curl libasound2

WORKDIR /tmp

# Verify sha256sum from https://github.com/CityOfZion/neon-wallet/releases  https://github.com/chuyqa/docker-CityofZionWallet-vnc/commit/1f6e286aefbbd50562a2a57030941b288f685a08
# Expected: /Linux.Neon_0.0.6_amd64.deb a718f352cbd66e1f3e67591d21127c48d3491d279b98b62aa35b61533362617c
RUN curl -fSL -o Linux.Neon_0.0.6_amd64.deb "https://github.com/CityOfZion/neon-wallet/releases/download/0.0.6/Linux.Neon_0.0.6_amd64.deb"
RUN echo "a718f352cbd66e1f3e67591d21127c48d3491d279b98b62aa35b61533362617c Linux.Neon_0.0.6_amd64.deb" | sha256sum -c -

RUN apt-get install -f /tmp/Linux.Neon_0.0.6_amd64.deb -y

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd neo123 ~/.vnc/passwd

RUN bash -c 'echo "neon" >> ~/.bashrc'

EXPOSE 5900

CMD [ "x11vnc", "-forever", "-usepw", "-create" ]

