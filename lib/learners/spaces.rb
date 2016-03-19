module Learners
  @classdoc = 'This class uses the number of spaces to establish if a name
belongs to human'
  class Spaces
    def initialize(data)
        @knowledge = {}
        learn(data)
    end

    @doc = 'Learn uses the count of spaces. Other versions of .learn could
correlate the exact number of spaces in a name with the score'
    def learn(data)
      data.each do |d|
        #TODO: remove mystery guests
        name = d[0]
        score = d[1]
        spaces = operation(name)

        #TODO: this direct attempt at correlating the number of spaces and
        # the reality of a name should be trained by a better datasource
        # to be useful
        @knowledge[spaces] = score
      end
    end

    def analyze(input)
      spaces = operation(input)
      # if a value is missing from @knowledge with the specific number of
      # spaces then find the closest one
      knowledge(spaces)
    end

    def operation(value)
      value.to_s.count(' ')
    end

    private

    def knowledge(spaces)
     # Elixir's guard behavior would be perfect here
     # is this an O(n) scan for the keys? no,  right?
     if @knowledge.keys.include?(spaces)
        @knowledge[spaces]
     else
        @knowledge[nearest_fit(spaces)]
     end
    end

    def nearest_fit(spaces)
      min_distance = Float::INFINITY
      #TODO: this should use the sorted array to save the minimum value
      key_to_use = -1
     # if operation("Bob Chunk Greenwalsh Blue Memories") == spaces
     #   binding.pry
     # end
      # O(n*log(n)) + O(n) :(
      # performing the sort should give a boost here
      # so that we can exit right away
      @knowledge.keys.sort.each do |key|
        if (key - spaces).abs < min_distance
          key_to_use = key
        end
      end
      key_to_use
    end

  end

end
