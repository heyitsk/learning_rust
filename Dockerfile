FROM rust:1.59.0
WORKDIR /app
RUN apt update && apt install lld clang -y
COPY . .
ENV APP_ENVIRONMENT production
ENV SQLX_OFFLINE true
RUN cargo build --release
ENV APP_ENVIRONMENT production
ENTRYPOINT ["./target/release/zero2prod"]
