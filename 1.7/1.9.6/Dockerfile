FROM java:7
MAINTAINER https://github.com/muccg

ENV ANT_VERSION 1.9.6

RUN mkdir -p /opt && \
    cd /opt && \
    wget -q http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    ln -s apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz

ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

ENTRYPOINT ["/opt/ant/bin/ant"]
CMD ["-version"]
