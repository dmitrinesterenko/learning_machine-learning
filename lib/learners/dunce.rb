module Learners
  @classdoc = "
    This class doesn't know how to learn
  "
  class Dunce
    def initialize(data)
      @data = data
    end

    @doc = 'data is a set of values and scores {"value0": 0.5, "value1":0.9}'
    def learn
      @data.each do |d|
        operation(d)
      end
    end

    @doc = 'this learner just knows nothing'
    def analyze(question)
      0.0
    end

    def operation(data_point)

    end
  end
end
