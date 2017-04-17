FROM python:2.7-alpine
MAINTAINER atonderski

# Install packages
RUN cp /etc/apk/repositories /tmp/repositories \
	&& echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
	&& apk add --no-cache -U --virtual build_dependencies \
		build-base \
		gfortran \
		libffi-dev \
	&& apk add --no-cache -U lapack-dev libstdc++ \	
	&& ln -s /usr/include/locale.h /usr/include/xlocale.h \
	&& pip install --upgrade numpy==1.12.1 \
	&& pip install --upgrade scipy==0.19.0 \
	&& apk del build_dependencies \
	&& mv /tmp/repositories /etc/apk/repositories

