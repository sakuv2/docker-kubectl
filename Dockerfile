FROM alpine AS curl
RUN apk add curl
ARG version="v1.15.0"
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${version}/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl

FROM scratch
COPY --from=curl /kubectl /
ENTRYPOINT ["/kubectl"]