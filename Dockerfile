FROM ubuntu:24.04

RUN apt update
RUN apt install apt-transport-https ca-certificates curl software-properties-common openjdk-17-jdk-headless -y
RUN apt install docker.io maven -y

RUN curl -LO https://dl.k8s.io/release/v1.32.0/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin
RUN curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` -o envsubst
RUN chmod +x envsubst && mv envsubst /usr/local/bin