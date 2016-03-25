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
    C::Trainer.new DataSets::Humans.new
  end

  let(:classifier) do
    C::Classifier.new(trainer)
  end

  xit 'TODO classifies humans as humans' do
    result = classifier.classify(humans)
    expect(result.length).to be(3)
    expect(result[0]['score']).to be(1.0)
  end
end
