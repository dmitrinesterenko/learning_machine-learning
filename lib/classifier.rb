class Classification::Classifier

  @output = {}

  def initialize(input)
  end

  def classify(input)
    input.each_with_index do |i|
      @output[i]['score'] = spaces(i) + all_letters(i)
    end
  end

  def spaces(input)
    input.split(' ').length
  end

  def all_letters(input)
    /[a-zA-Z]/.match(input.gsub(' ', ''))
  end
end
