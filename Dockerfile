FROM shippableimages/ubuntu1204_base:0.0.3

# lein needs java to execute
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections;
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections;
RUN add-apt-repository ppa:webupd8team/java;
RUN apt-get update &&  apt-get install -y \
    oracle-java7-installer;

RUN apt-get update && apt-get install -y \
    wget;

RUN cd /tmp && \
    wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein;
    
RUN chmod +x /tmp/lein
RUN cp -vr /tmp/lein /usr/local/bin/lein2

ENV LEIN_ROOT true
RUN /bin/bash lein2

CMD ["lein2"]
