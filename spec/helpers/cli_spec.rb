require_relative '../spec_helper'

describe Classification::CLI do
  let(:trainer_class) do
    Classification::Trainer
  end

  describe '.new' do
    context 'ngram' do
      let(:ngram_input) do
        {learner: 'ngram', length: 2,  dataset: 'names'}
      end

      let(:subject) do
        described_class.new ngram_input
      end

      context 'classifier' do
        it 'has a dataset' do
          expect(subject.classifier.trainer.class).to eq(Classification::Trainer)
        end

        it 'has a learner' do
          expect(subject.classifier.learner.class).to eq(Learners::Ngram)
        end
      end
    end

    context 'dunce' do
      let(:dunce_input) do
        {learner: 'dunce', dataset: 'names'}
      end

      let(:subject) do
        described_class.new dunce_input
      end

      context 'classifier' do
        it 'has a trainer' do
          expect(subject.classifier.trainer.class).to eq(trainer_class)
        end
      end
    end
  end

  ## these testing strategies for CLI are unusual  https://gist.github.com/joshcheek/5561023
#
## TODO: none of these tests worked without having to alter the
## Classification::CLI in ways that would make it unusable for actual running.
#  def cli(data="")
#    input = StringIO.new data
#    output = StringIO.new
#    described_class.new(input, output)
#  end
#
#  context "takes a name" do
#    it "asks you for a name" do
#      expect(cli.name.string).to include "Please provide a name"
#    end
#
#    it "reads the name" do
#      expect(cli("Bob Anderson").read.string).to eq "Bob Anderson"
#    end
#
#    it "scores name" do
#      expect(cli.write_score("0.5").string).to include "I got 0.5"
#    end
#  end
#
#  context "rescores a name" do
#    it "asks if the score is correct" do
#      expect(cli.correct?.string).to include "Am I correct?"
#    end
#
#    it "takes in the score you provide" do
#      expect(cli("1.0").read.string).to eq "1.0"
#    end
#  end

#  context "in a loop" do
#    let(:classifier) { double(Classification::Classifier) }
#    let(:sample) { "Liane Cartman" }
#    before do
#      cli.should_receive(:running?).and_return(true, false)
#    end
#
#    it "loops" do
#      cli(sample).should_receive(:name)
#      #cli(sample).should_receive(:read).and_return(sample, 1.0)
#      allow(@input).to receive(:read).and_return(sample, 1.0)
#      allow(cli).to receive(:read).and_return(sample, 1.0)
#      classifier.should_receive(:score).with(sample).and_return(0.5)
#
#      binding.pry
#      cli(sample).start
#    end
#
#    it "asks to enter a name again" do
#      cli.start
#      cli.name
#      name = cli(sample).read
#      allow(classifier).to receive(:score).with(name).and_return(0.5)
#      score = classifier.score(name)
#      cli.write_score score
#      cli.correct?
#      cli("1.0").read
#      allow(classifier).to receive(:rescore).with(name, score).and_return(1.0)
#      score = classifier.rescore(name, score)
#      expect(cli.name.string).to include "Please provide a name"
#    end
#  end

end
