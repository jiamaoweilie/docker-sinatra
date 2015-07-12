FROM ubuntu:14.04

MAINTAINER wei 20150629

RUN apt-get update
RUN apt-get install -y build-essential wget git
RUN apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev libmysqlclient-dev
RUN apt-get clean

RUN wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
RUN tar xvf ruby-2.2.2.tar.gz
RUN cd /ruby-2.2.2; ./configure; make install

RUN gem update --system

RUN gem install bundler

ADD app.rb /app.rb

ADD Gemfile /Gemfile

ADD config.ru /config.ru

RUN bundle install

EXPOSE 9292

CMD rackup --host 0.0.0.0