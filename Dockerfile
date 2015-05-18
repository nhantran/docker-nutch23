FROM nhantran/oraclejdk17
MAINTAINER Nhan Tran<tranphanquocnhan@gmail.com>

RUN apt-get update
WORKDIR /opt
RUN wget https://github.com/apache/nutch/archive/release-2.3.zip
RUN unzip release-2.3.zip && mv nutch-release-2.3 nutch && rm release-2.3.zip
RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.7.1-bin.zip
RUN unzip apache-ant-1.7.1-bin.zip && mv apache-ant-1.7.1 ant && rm apache-ant-1.7.1-bin.zip
ADD config/nutch-site.xml nutch/conf/nutch-site.xml
ADD config/gora.properties nutch/conf/gora.properties
ADD config/ivy.xml nutch/ivy/ivy.xml
RUN cd nutch && /opt/ant/bin/ant runtime

RUN mkdir nutch/runtime/urls
ADD config/seed.txt nutch/runtime/urls/seed.txt

CMD []
