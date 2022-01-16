FROM ruby:2.7-alpine

# preinstall for jekyll
RUN apk update \
&&  apk add --no-cache \
	gcc \
	g++ \
	git \
	make \
	musl-dev \
	vim

# install jekyll & bundle
RUN gem install jekyll bundler

EXPOSE	4000

CMD [ "/bin/ash" ]
