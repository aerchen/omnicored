FROM ubuntu

ENV VERSION 1.0

ENV W_DIR /usr/local
WORKDIR $W_DIR

RUN apt-get update

RUN apt-get install git -y
RUN apt-get install pkg-config -y
RUN apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y
RUN apt-get install libboost-all-dev -y

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:bitcoin/bitcoin -y
RUN apt-get update -y
RUN apt-get install libdb4.8-dev libdb4.8++-dev -y

RUN apt-get install libminiupnpc-dev -y

RUN apt-get install libzmq3-dev -y

RUN apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y

RUN apt-get install libqrencode-dev -y

RUN git clone https://github.com/OmniLayer/omnicore.git

RUN cd $W_DIR/omnicore && ./autogen.sh
RUN cd $W_DIR/omnicore && ./configure
RUN cd $W_DIR/omnicore && make
RUN cd $W_DIR/omnicore && make install

EXPOSE 8332
EXPOSE 18332

RUN mkdir /root/.bitcoin

