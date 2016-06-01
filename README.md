# purpose
Learning machine learning with Ruby one failing spec at a time.

# dataset
This experiment uses the problem of learning which names belong to humans and
which do not. It attempts a few naive algorithms going from most to least in
order:
  * dunce - learns nothing ever.
  * space_dunce - thinks that spaces are all of the rage
  * spaces - thinks that spaces are cool as long as they match the range learned from data
  * ngram - currently a 2 gram that analyzes provided names and builds a map of
    ngram => human likelihood score association and then uses this map to score
new names

All of the learners ask for more input and then attempt to adjust based on the
score that you as a human feel those names deserve. Except for the dunce; that
one learns nothing.
# building
Build this project image using Docker.
```sh
  docker build --tag human_or_not:latest .
```

# running
Running an NGram learner with the dataset of names use the following command.
```sh
  docker run --rm -it human_or_not:latest  # would drop you into running an NGram learner with a dataset of names
  ruby run.rb --learner=ngram --dataset=names
  # or use a different data set
  ruby run.rb --learner=ngram --dataset=guildies
  # or use a different lolgarithm for learning
  ruby run.rb --learner=spaces --dataset=guildies
```

![running](assets/ngram.gif)

# obviously data
machine learning heavily depends on the data that you provide.

Even the simplest case of a spaces learner if you provide data that
classifies "abced asdf" as a 0.0 relevance then "Bob Hope" would also be 0.0
relevance.

In cases of using the ngram learner you should play around to see how the data
you provide when you interact with the learner by running it (see: running)


