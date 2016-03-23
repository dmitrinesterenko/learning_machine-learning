class Classification::Trainer
  #@doc
  #  Store the training data
  #
  def initialize(sample={})
    @sample = {}
    train(sample)
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

  def data
    @data ||= []
    @sample.each do |h|
      @data << {name: h[0].to_s, score: h[1]}
    end
    @data
  end


end
