FROM rust:latest as builder
RUN cargo install mdbook
COPY . .
RUN mdbook build

FROM nginx:alpine
COPY --from=builder book /usr/share/nginx/html
