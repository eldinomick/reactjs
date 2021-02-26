FROM ubuntu:latest

LABEL maintainer="Cadot.info"
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
		curl \
		software-properties-common \
        gpg-agent \
		&& apt-get clean \
		&& rm -fr /var/lib/apt/lists/*

RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y --no-install-recommends \
	yarn \	
		nodejs \
		npm \
		nano \
		git \
		unzip \
		wget \
	&& apt-get clean \
	&& rm -fr /var/lib/apt/lists/*


RUN apt-get install -f

RUN npm install npm -g
RUN npm install yarn -g

WORKDIR "/app"
EXPOSE 3000
CMD ["yarn", "start"]

