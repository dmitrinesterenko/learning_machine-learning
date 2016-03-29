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

  describe ".classify" do
    context "when there is input" do
      let(:input) { "Mandy Moore" }

      it "accepts it" do
        allow(classifier).to receive(:classify) { input }
        classifier.classify(input)
      end

      it "outputs a score" do
        expect(classifier.classify(input).class).to be Float
        expect(classifier.classify(input)).to be < 1.0
      end

      it "asks for a rescore" do
        expect(classifier).to receive(:ask).and_return("What do you think?")
        classifier.ask
      end

      it "applies the new score to the trainer" do
        expect(classifier.rescore(input, 1.0)).to include(name: input, score:
1.0)
      end

      it "relearns from the new training data" do
        classifier.rescore(input, 1.0)
        expect(classifier.classify(input)).to eq 1.0
      end
    end
  end
end
