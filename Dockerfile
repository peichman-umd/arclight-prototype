FROM ruby:2.5

RUN apt-get update && apt-get install -y openjdk-8-jdk

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# arclight user so Solr doesn't complain about being run as root
RUN useradd -ms /bin/bash arclight
USER arclight

WORKDIR /home/arclight

COPY --chown=arclight:arclight . .
RUN bundle install
RUN rails db:migrate

CMD solr_wrapper & rails s
