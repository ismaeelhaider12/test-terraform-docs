FROM ubuntu:20.04

RUN apt update
COPY dockerrun.sh  ossec.conf /
RUN chmod +x /dockerrun.sh 
RUN apt-get update && apt-get install -y \
  procps curl apt-transport-https gnupg2 inotify-tools && \
  apt install python -y && curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && \
  apt install python3-pip -y && pip3 install boto3 && pip3 install awscli && \
  update-alternatives --install /usr/bin/python python /usr/bin/python3 1

CMD ["/dockerrun.sh"]
