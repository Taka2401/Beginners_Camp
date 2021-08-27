FROM ruby:2.6.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn imagemagick mariadb-client vim

WORKDIR /Beginners_Camp

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /Beginners_Camp

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "puma", "-b", "0.0.0.0", "-p", "3000", "-e", "development"]
