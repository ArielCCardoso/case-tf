FROM alpine

LABEL BaseImage="alpine"                                   \
      Author="Ariel C. Cardoso <arielccardoso@live.com>"

USER root

ENV TF_VERSION=0.12.20

RUN apk add --no-cache --update curl unzip git openssh-client

RUN curl https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
    --output tf.zip && unzip tf.zip -d /bin && rm -f tf.zip

COPY entrypoint /entrypoint

RUN chmod 755 /entrypoint

ENTRYPOINT ["/entrypoint"]