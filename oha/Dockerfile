FROM rust:alpine as builder
RUN apk add build-base openssl-dev
RUN cargo install oha

FROM scratch
LABEL source="oha <github.com/hatoo/oha>"
LABEL maintainer="jsav0 <wfnintr@null.net>"
COPY --from=builder /usr/local/cargo/bin/oha /usr/local/bin/oha
ENTRYPOINT ["oha"]
