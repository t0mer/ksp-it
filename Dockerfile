FROM techblog/selenium:latest
LABEL maintainer="tomer.klein@gmail.com"

ENV PYTHONIOENCODING utf-8
ENV LANG C.UTF-8
ENV PHONE_NUMBER ""
ENV SCHEDULES ""
ENV CIBUS_PASSWORD ""
ENV RESTAURANT_ID ""
ENV MIN_VALUE 30
ENV MAX_VALUE 50
ENV BOT_TOKEN ""
ENV CHAT_ID ""

RUN apt update -yqq

RUN apt -yqq install python3-pip && \
    apt -yqq install libffi-dev && \
    apt -yqq install libssl-dev

RUN  pip3 install --upgrade pip --no-cache-dir && \
     pip3 install --upgrade setuptools --no-cache-dir

COPY requirenebts.txt /tmp

RUN pip3 install -r /tmp/requirenebts.txt
     
RUN mkdir -p /app/config

COPY app /app

WORKDIR /app
 
ENTRYPOINT python /app/app.py