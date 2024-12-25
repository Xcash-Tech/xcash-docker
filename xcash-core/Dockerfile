###########################
# Builder image
###########################
FROM debian:buster-20240612 AS builder
ENV MONERO_V=0


RUN apt-get update && apt-get install -y build-essential cmake pkg-config \
    libzmq3-dev libssl-dev libunbound-dev libsodium-dev libunwind8-dev \
    liblzma-dev libreadline-dev libldns-dev libexpat1-dev libpgm-dev \
    qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev \
    protobuf-compiler libudev-dev libboost-chrono-dev libboost-date-time-dev \
    libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev \
    libboost-regex-dev libboost-serialization-dev libboost-system-dev \
    libboost-thread-dev ccache doxygen graphviz

RUN apt-get install libgtest-dev -y && \
    cd /usr/src/gtest && \
    cmake . && \
    make -j2 && \
    mv libg* /usr/lib/

#    git config --global http.postBuffer 1048576000 && \
RUN apt-get install git -y && \
    git clone -b master --recursive --depth=1 https://github.com/Xcash-Tech/xcash-tech-core xcash && \
    cd xcash && git submodule init && git submodule update && \
    make -j2

# RUN ls -la /xcash/build/release/bin && sleep 600


###########################
# Production image
###########################
FROM debian:buster-20240612
ENV MONERO_V=test

COPY --from=builder /xcash/build/release/bin/* /root/xcash/

RUN apt-get update && apt-get install -y \
    libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev \ 
    libboost-regex-dev libzmq3-dev libreadline-dev libhidapi-dev libusb-1.0-0-dev \
    libunbound-dev libboost-date-time-dev libboost-thread-dev

RUN mkdir /data && \
    mkdir /log 

#COPY xcashd.conf /root/xcash/xcashd.conf
WORKDIR /root/xcash/

CMD ["tail", "-f", "/dev/null"]
# CMD [ "./xcashd", "--config-file", "./xcashd.conf", "--non-interactive" ]
