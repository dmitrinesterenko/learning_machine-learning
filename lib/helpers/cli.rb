#this could be useful for showing a section of the learner's adjustment
#require 'io/console'
#rows, columns = $stdout.winsize
#puts "Your screen is #{columns} wide and #{rows} tall"

class Classification::CLI
  attr_reader :classifier
  attr :running

  def initialize(params, input=$stdin, output=$stdout)
    @input = input
    @output = output
    data = Module.const_get("DataSets::#{params[:dataset].capitalize}").data
    trainer = Classification::Trainer.new data
    learner = Module.const_get("Learners::#{params[:learner].capitalize}").new trainer.data
    @classifier = Classification::Classifier.new learner, trainer
    @running = true
  end

  def start
    loop do
      break unless running?
      begin
        name
        input = read
        write_score @classifier.classify(input)
        correct?
        new_score  = read
        write_data @classifier.rescore(input,new_score.to_i)
        write_data @classifier.classify(input)
      rescue Interrupt
        @running = false
      end
    end
    puts "Thank you! Let's learn again soon."
  end

  def running?
    @running
  end

  def name
    @output.puts "Please provide a name"
  end

  def read
    @input.gets.chomp
  end

  def write_score(score)
    @output.puts "#{random_humanizer} human (#{score})" if score > 0.7
    @output.puts "#{random_humanizer} bots. Stay away (#{score})" if score <= 0.7
  end

  def write_data(data)
    @output.puts "#{data}"
  end

  def correct?
    @output.puts "What's your score?"
  end

  private
  def humanizers
    ["I think", "I reckon", "I see ", "I gather"]
  end

  def random_humanizer
    humanizers[Random.rand(humanizers.length)]
  end
end
