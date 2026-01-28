# 使用最新的 Ubuntu 作为基础镜像
FROM ubuntu:latest

# 安装 GCC 编译器
RUN apt-get update && \
    apt-get install -y gcc && \
    apt-get install -y build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 复制 C 源代码
#COPY hello.c .

# 编译 C 代码
#RUN gcc -o hello hello.c

# 运行程序
#CMD ["./hello"]   
