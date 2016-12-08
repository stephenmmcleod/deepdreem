FROM crisbal/torch-rnn:base
MAINTAINER Stephen McLeod <stephen@vsvsvs.org>

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN add-apt-repository ppa:fkrull/deadsnakes
RUN apt-get update

RUN apt-get -y install \
    python3.5 \
    python3.5-dev \
    libncurses5-dev

COPY . /root/neuralNet

# RUN pip install --upgrade theano
# RUN pip install numpy scipy theano-lstm python-midi

RUN find . -type f -name "*" |  xargs chown -R root:root

WORKDIR /root/neuralNet/scripts

