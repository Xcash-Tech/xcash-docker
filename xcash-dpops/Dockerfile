###########################
# Builder image
###########################
FROM debian:buster-20240612 AS builder

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    build-essential cmake pkg-config \
    libssl-dev \
    libmongoc-dev \
    libuv1-dev \
    libhiredis-dev \
    libjansson-dev \
    libjansson4


#    git config --global http.postBuffer 1048576000 && \
RUN apt-get install git -y && \
    git clone -b master --recursive --depth=1 https://github.com/Xcash-Tech/xcash-tech-dpops.git xcash && \
    cd xcash && \
    make -j4

# RUN ls -la /xcash/build && sleep 600


###########################
# Production image
###########################
FROM debian:buster-20240612

COPY --from=builder /xcash/build/xcash-dpops /root/xcash/xcash-dpops

RUN apt-get update && apt-get install -y \
    libssl1.1 \
    libmongoc-1.0-0 \
    libuv1 \
    libhiredis0.14 \
    libjansson4

# RUN mkdir /log 

WORKDIR /root/xcash/

CMD ["tail", "-f", "/dev/null"]
