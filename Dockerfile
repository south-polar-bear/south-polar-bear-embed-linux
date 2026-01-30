# 使用最新的 Ubuntu 作为基础镜像
FROM ubuntu:latest

# 一次性完成所有配置
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        ca-certificates \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置环境变量
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# 安装 GCC 编译器
RUN apt-get update && \
    apt-get install -y gcc && \
    apt-get install -y build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    chrpath \
    cpio \
    debianutils \
    diffstat \
    file \
    gawk \
    git \
    iputils-ping \
    libacl1 \
    locales \
    python3 \
    python3-git \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    python3-subunit \
    socat \
    texinfo \
    unzip \
    wget \
    xz-utils \
    zstd && \
    rm -rf /var/lib/apt/lists/*
RUN echo "=== Locale Test ===" && \
    locale -a && \
    echo "=== Current Locale ===" && \
    locale && \
    echo "=== Python Encoding ===" && \
    python3 -c "import sys; print('Encoding:', sys.stdout.encoding)" || \
    echo "Python not installed"
# 复制 C 源代码
#COPY hello.c .

# 编译 C 代码
#RUN gcc -o hello hello.c

# 运行程序
#CMD ["./hello"]   
