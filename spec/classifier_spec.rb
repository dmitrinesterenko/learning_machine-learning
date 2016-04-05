require_relative 'spec_helper'
describe C::Classifier do
  let(:humans) do
    ["Anderson Cooper",
     "Andy Anderson",
     "Meg White"]
  end

  let(:bees) do
    ["Buzzy",
     "Bx",
     "S1234"]
  end

  let(:trainer) do
    C::Trainer.new DataSets::Names.data
  end

  ## Use 2 gram with data
  let(:learner) do
    Learners::Ngram.new 2, trainer.data
  end

  let(:classifier) do
    C::Classifier.new learner, trainer
  end

  describe ".new" do
    context "provided a learner" do
      it "creates a new classifier" do
        expect(classifier.class).to eq C::Classifier
      end
    end
  end

  let(:input) { "Mandy Moore" }

  describe ".classify" do
    context "when there is input" do

      it "accepts it" do
        classifier.should_receive(:classify).with(input).and_return(0.5)
        classifier.classify(input)
      end

      it "outputs a score" do
        expect(classifier.classify(input).class).to be Float
        expect(classifier.classify(input)).to be < 1.0
      end
    end
  end

  describe ".rescore" do
    context "when rescoring" do
      it "applies the new score to the trainer" do
        expect(classifier.rescore(input, 1.0)).to include(name: input, score:
1.0)
      end

      it "relearns from the new training data" do
        classifier.rescore(input, 1.0)
        expect(classifier.classify(input)).to eq 1.0
      end

      it "only rescores when a numeric value is provided" do
        classifier.rescore(input, "1.0")
        expect(classifier.classify(input)).to eq 0.0
      end
    end
  end
end
