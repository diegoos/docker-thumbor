FROM python:2

LABEL maintainer="diegoos"

VOLUME /data

# base OS packages
RUN  \
    awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y autoremove && \
    apt-get install -y -q \
        ffmpeg \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libgtk2.0-dev \
        python-numpy \
        python-pycurl \
        libgraphicsmagick++1-dev \
        libboost-python-dev \
        webp \
        python-opencv \
        python-dev && \
    apt-get clean

ENV HOME /app
ENV SHELL bash
ENV WORKON_HOME /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --trusted-host None --no-cache-dir \
   -r /app/requirements.txt

COPY conf/thumbor.conf /app/thumbor.conf
COPY conf/the.key /app/the.key

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80 8888
