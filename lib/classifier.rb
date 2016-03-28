class Classification::Classifier
  attr_accessor :trainer, :learner

  def initialize(learner, trainer)
    @trainer = trainer
    @learner = learner
  end

  def classify(input)
    @learner.analyze(input)
  end

  def ask
    "What do you think?"
  end

  def rescore(input, score)
    @trainer.train( input => score)
    @learner.learn(@trainer.data)
  end
end
