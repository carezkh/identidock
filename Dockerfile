# This docker file is used to create a docker for a WEB server.

FROM xavijs/docker-flask-uwsgi-python3

MAINTAINER carezkh <2010267516@qq.com>

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN apt-get install python3.4
RUN pip install Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1 redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
#CMD ["uwsgi","--http","0.0.0.0:9090","--wsgi-file","/app/identidock.py","--callable","app","--stats","0.0.0.0:9191"]

