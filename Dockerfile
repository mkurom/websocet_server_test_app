
FROM ruby:3.1.0

ENV APP_ROOT /websocket_test_app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
ADD . $APP_ROOT

RUN bundle install