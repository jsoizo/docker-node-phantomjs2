FROM node
MAINTAINER Jun Sakamoto <jun.skmt.12@gmail.com>

# Install dependencies
RUN apt-get update \
    && apt-get install -y\
        build-essential \
        g++ \
        flex \
        bison \
        gperf \
        ruby \
        perl \
        libsqlite3-dev \
        libfontconfig1-dev \
        libicu-dev \
        libfreetype6 \
        libssl-dev \
        libpng-dev \
        libjpeg-dev \
        python \
        libx11-dev \
        libxext-dev

# Build phantomjs
WORKDIR /usr/local
RUN git clone https://github.com/ariya/phantomjs.git \
    && cd phantomjs \
    && git checkout 2.0 \
    && ./build.sh --confirm \
    && ln -s /usr/local/phantomjs/bin/phantomjs /usr/local/bin/phantomjs

# Run 
EXPOSE 8910
CMD ["/usr/local/bin/phantomjs"]
