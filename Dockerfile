FROM node:6.9
MAINTAINER Michał Knapik <michal.knapik@u2i.com>

RUN wget --quiet --output-document=dumb-init.deb \
      https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64.deb && \
  dpkg --install dumb-init.deb && \
  rm dumb-init.deb

RUN npm install --no-color --global yarn@0.20.3

WORKDIR /code

ADD package.json /code
ADD yarn.lock /code
RUN yarn install && yarn cache clean
ADD . /code

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["tail", "-f", "/dev/null"]