module Learners
  @classdoc = 'This class uses the number of spaces to establish if a name
belongs to human'
  class SpacesDunce
    def initialize
        @minimum_space_count = Float::INFINITY
    end

    @doc = 'Learn uses the count of spaces. Other versions of .learn could
correlate the exact number of spaces in a name with the score'
    def learn(data)
      data.each do |d|
        #TODO: remove mystery guests
        name = d[0]
        #score = d[1]
        spaces = operation(name)
        @minimum_space_count = recalibrate(spaces)

        #TODO: this direct attempt at correlating the number of spaces and
        # the reality of a name should be trained by a better datasource
        # to be useful
        #@knowledge[spaces] = score
      end
    end

    def analyze(input)
      spaces = operation(input)
      if spaces >= @minimum_space_count
        1.0
      else
        0.0
      end
      #@knowledge[spaces]
    end

    def operation(value)
      value.to_s.count(' ')
    end

    def recalibrate(space_count)
      if space_count < @minimum_space_count
        space_count
      else
        @minimum_space_count
      end
    end
  end

end
