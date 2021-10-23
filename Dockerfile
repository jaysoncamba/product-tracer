FROM ruby:2.6.0

WORKDIR /code
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN bundle install
COPY . /code

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]