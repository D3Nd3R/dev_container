FROM alpine:3.21 AS alp_builder


RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
    clang \
    clang-dev \
    alpine-sdk \
    dpkg \
    boost-dev \
    cmake 

RUN ln -sf /usr/bin/clang /usr/bin/cc \
    && ln -sf /usr/bin/clang++ /usr/bin/c++ \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang 10\
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 10\
    && update-alternatives --auto cc \
    && update-alternatives --auto c++ \
    && update-alternatives --display cc \
    && update-alternatives --display c++ \
    && ls -l /usr/bin/cc /usr/bin/c++ \
    && cc --version \
    && c++ --version


ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
