FROM ruby:3.2.0

COPY Gemfile . Gemfile.lock ./
RUN bundle install

WORKDIR /app

COPY . .

CMD echo 'Usage: docker run -v `pwd`/pages:/app/pages web-fetch "./fetch" --metadata https://pro.sabu.fr'