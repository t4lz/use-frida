FROM arm64v8/rust:latest as builder

RUN apt update && apt install -y cmake curl openssl libssl-dev pkg-config clang libclang-dev llvm llvm-dev wget

RUN wget -L "https://github.com/frida/frida/releases/download/15.2.2/frida-gum-devkit-15.2.2-linux-arm64.tar.xz"
RUN tar -xf frida-gum-devkit-15.2.2-linux-arm64.tar.xz
RUN mv frida-gum.h /usr/local/include
RUN mv libfrida-gum.a /usr/local/lib

RUN wget -L "https://github.com/frida/frida/releases/download/15.2.2/frida-core-devkit-15.2.2-linux-arm64.tar.xz"
RUN tar -xf frida-core-devkit-15.2.2-linux-arm64.tar.xz
RUN mv frida-core.h /usr/local/include
RUN mv libfrida-core.a /usr/local/lib


WORKDIR /usr/src/myapp
COPY . .
CMD ["cargo", "build"]
