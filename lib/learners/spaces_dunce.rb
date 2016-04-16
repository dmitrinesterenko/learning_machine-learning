module Learners
  @classdoc = 'This class uses the number of spaces to establish if a name
belongs to human'
  class SpacesDunce
    def initialize(data)
      @minimum_space_count = Float::INFINITY
      @data = data
    end

    @doc = 'Learn uses the count of spaces. Other versions of .learn could
correlate the exact number of spaces in a name with the score'
    def learn
      @data.each do |d|
        #TODO: remove mystery guests
        name = d[0]
        score = d[1]
        spaces = operation(name)
        @minimum_space_count = recalibrate(spaces, score)
      end
    end

    def analyze(input)
      spaces = operation(input)
      if spaces >= @minimum_space_count
        1.0
      else
        0.0
      end
    end

    def operation(value)
      value.to_s.count(' ')
    end

    def recalibrate(space_count, score)
      if space_count < @minimum_space_count && scores?(score)
        space_count
      else
        @minimum_space_count
      end
    end

    @doc = "does the score for a record pass the threshold?"
    def scores?(score)
      return score > 0.5
    end
  end

end
