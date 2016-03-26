class Classification::Trainer
  doc "Store the training data"
  def initialize(sample={})
    @sample = {}
    train(sample)
  end

  doc "Training means adding data that is provided into the known dataset"
  def train(sample)
    @sample.merge!(sample)
  end

  doc " If the sample size is above a threshold then we have enough training
    data"
  def trained?
    @sample.length > 0
  end

  def all()
    @sample
  end

  doc "Get the score with one values that had been used in training"
  def get(thing)
    @sample[thing.to_sym]
  end

  doc "Get structured data that contains a name and a score as key value pairs
for each of the entries"
  def data
    @data ||= []
    @sample.each do |h|
      @data << {name: h[0].to_s, score: h[1]}
    end
    @data
  end
end
