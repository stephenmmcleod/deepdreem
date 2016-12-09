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

RUN apt-get -y install \
    libfftw3-3 \
    libfftw3-dev \
    sox \
    libsox-dev \
    libsox-fmt-all

COPY . /root/neuralNet


# RUN luarocks install https://raw.github.com/soumith/torch-signal/master/rocks/signal-scm-1.rockspec
# RUN luarocks install https://raw.githubusercontent.com/soumith/lua---audio/master/audio-0.1-0.rockspec

# RUN luarocks install nngraph
# RUN luarocks install optim
# RUN luarocks install nn

# NEAT THING
# RUN pip install --upgrade theano
# RUN pip install numpy scipy theano-lstm python-midi

RUN find . -type f -name "*" |  xargs chown -R root:root

WORKDIR /root/neuralNet

