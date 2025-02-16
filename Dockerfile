FROM ubuntu:24.04

RUN apt update
RUN apt install apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update

RUN sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

RUN systemctl enable docker
RUN curl -LO https://dl.k8s.io/release/v1.32.0/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin

ENTRYPOINT ["dockerd"]