module Learners
  @classdoc = 'This class uses ngram analysis to establish if a name belongs to
a human'
  class Ngram
    def initialize(size, data)
      @ngram_terms = {}
      @size = size
      data.each do |d|
        ngram(d)
      end
    end

    @doc = "data is {name: String, score: 'Number'}"
    def ngram(data)
      term = data[:name]
      ngrams = term.length / @size
      ngrams.times do |n|
        n = n * @size
        # all of the ngrams for this name come from a name with the assigned
        # score
        @ngram_terms[term.downcase[n...n+@size]] = data[:score]
      end
      @ngram_terms
    end

    @doc = "data is String. Result is an unscored ngram ary"
    def _ngram(data)
      #TODO: preprocess data method
      data = data.downcase
      ngram_length = data.length / @size
      ngram_result = []
      ngram_length.times do |n|
        #TODO: make a moving window method
        start = n * @size
        ngram_result << data[start...start+@size]
      end
      ngram_result
    end

    def analyze(input)
      total_score = 0
      #TODO: stop doing this bad thing
      ngram = _ngram(input)
      ngram.each do |npiece|
        begin
          total_score += @ngram_terms[npiece]
        rescue TypeError
          puts "Should we penalize ngrams that don't have a match?"
        end
      end
      total_score / ngram.length
    end

  end
end