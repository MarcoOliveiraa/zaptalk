FROM ruby:2.5.1

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Instalando NODEJS
RUN apt-get update
RUN apt-get install -y nodejs --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

# Instalando POSTGRES SERVER
RUN apt-get update
RUN apt-get install -y postgresql postgresql-contrib
RUN rm -rf /var/lib/apt/lists/*

# Instalando POSTGRES CLIENT
RUN apt-get update
RUN apt-get install -y postgresql-client --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

COPY Gemfile /usr/src/app/

COPY Gemfile.lock /usr/src/app/

RUN bundle install

COPY . /usr/src/app

EXPOSE 3000
