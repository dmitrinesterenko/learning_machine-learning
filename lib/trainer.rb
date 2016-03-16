class Classification::Trainer
  #@doc
  #  Store the training data
  #
  def initialize()
    @sample = {}
  end

  def train(sample)
    @sample.merge!(sample)
  end

  def trained?
    @sample.length > 0
  end

  def all()
    @sample
  end

  def get(thing)
    @sample[thing.to_sym]
  end

end
