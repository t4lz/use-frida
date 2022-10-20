FROM arm64v8/rust:latest as builder

RUN apt update && apt install -y cmake curl openssl libssl-dev pkg-config clang libclang-dev llvm llvm-dev wget

WORKDIR /usr/src/myapp
COPY . .
CMD ["cargo", "build"]
