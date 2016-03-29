class Classification::CLI
  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
  end

  def name
    @output << "Please provide a name"
    puts @output.string
  end
end
