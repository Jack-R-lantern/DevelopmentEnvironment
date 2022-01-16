FROM ruby:alpine3.14

# preinstall for jekyll
RUN apk update \
&&  apk add --no-cache \
	gcc \
	g++ \
	make \
	musl-dev \
	vim

# install jekyll & bundle
RUN gem install jekyll bundle

EXPOSE	4000

CMD [ "/bin/ash" ]
