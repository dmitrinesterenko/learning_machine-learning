class Classification::Trainer
  #@doc
  #  Store the training data
  #
  def initialize(sample)
    @sample = sample
  end

  def trained?
    @sample.length > 0
  end

  # add a sample to the training
  def add(sample)
    @sample << sample
  end

  # return the right train set of data
  def get(sample_type)
    @sample
  end

end
