
FROM rust:1.77

WORKDIR /app

COPY . .

# Install host build dependencies.
RUN rustc hello.rs

FROM debian:12

COPY --from=0 /app/hello /root/app

# What the container should run when it is started.
CMD ["/root/app"]
