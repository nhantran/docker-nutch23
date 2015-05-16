FROM nhantran/oraclejdk17
MAINTAINER Nhan Tran<tranphanquocnhan@gmail.com>

RUN apt-get update
WORKDIR /opt
RUN wget https://github.com/apache/nutch/archive/release-2.3.zip
RUN unzip release-2.3.zip
RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.7.1-bin.zip
RUN unzip apache-ant-1.7.1-bin.zip
ADD config/nutch-site.xml nutch-release-2.3/conf/nutch-site.xml
RUN sed -i -e "s/# gora.cassandrastore.servers=localhost:9160/gora.cassandrastore.servers=webstore01:9160/g" nutch-release-2.3/conf/gora.properties
RUN cat nutch-release-2.3/conf/gora.properties
ADD config/ivy.xml nutch-release-2.3/ivy/ivy.xml
RUN cat nutch-release-2.3/ivy/ivy.xml
RUN cd nutch-release-2.3 && /opt/apache-ant-1.7.1/bin/ant runtime

CMD []
