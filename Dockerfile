FROM localstack/localstack

RUN \
    apt-get update -y && \
    apt-get install unzip -y && \
    apt-get install wget -y && \
    apt-get install vim -y

RUN wget https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip

RUN unzip terraform_1.7.5_linux_amd64.zip

RUN mv terraform /usr/local/bin/
RUN terraform --version 

ENV AWS_DEFAULT_REGION='[us-east-1]'
ENV AWS_ACCESS_KEY_ID='[test]'
ENV AWS_SECRET_ACCESS_KEY='[test]'

CMD [ "docker-entrypoint" ]

EXPOSE 4510-4566