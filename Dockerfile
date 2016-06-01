FROM ruby:latest
MAINTAINER "Dmitri Nesterenko <dmitri.nesterenko+learningml@gmail.com"
ENV WORKDIR=/webapp/current
WORKDIR $WORKDIR
COPY . $WORKDIR
RUN bundle install
CMD ["run.rb", "--learner=ngram", "--dataset=guildies"]
ENTRYPOINT ["ruby"]

