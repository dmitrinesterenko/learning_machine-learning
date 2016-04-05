#this could be useful
#require 'io/console'
#rows, columns = $stdout.winsize
#puts "Your screen is #{columns} wide and #{rows} tall"

class Classification::CLI
  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
    trainer = Classification::Trainer.new DataSets::Names.data
    puts DataSets::Names.data
    learner = Learners::Ngram.new 2, trainer.data
    @classifier = Classification::Classifier.new learner, trainer
  end

  def start
    loop do
      break unless running?
      name
      input = read
      write_score @classifier.classify(input)
      correct?
      new_score  = read
      write_score @classifier.rescore(input,new_score.to_i)
      write_score @classifier.classify(input)
    end
  end

  def running?
    true
  end

  def name
    @output.puts "Please provide a name"
  end

  def read
    @input.gets.chomp
  end

  def write_score(score)
    @output.puts "I got #{score}"
  end

  def correct?
    @output.puts "Am I correct?"
  end
end
