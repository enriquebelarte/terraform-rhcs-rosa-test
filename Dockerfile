FROM registry.access.redhat.com/ubi9/ubi:latest
COPY . .
RUN yum update -y && yum install -y yum-utils shadow-utils unzip tar
RUN yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
    yum -y install terraform
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && \
    ./aws/install -i /usr/local/aws-cli -b /usr/local/bin
RUN curl -sL "https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux.tar.gz" -o "rosa.tar.gz" && \
    tar xfvz rosa.tar.gz --no-same-owner && mv rosa /usr/local/bin/rosa

