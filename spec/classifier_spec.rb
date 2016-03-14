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
    trainer = C::Trainer.new(humans)
    trainer.get(:humans)
  end

  let(:classifier) do
    C::Classifier.new(trainer)
  end

  it 'classifies humans as humans' do
    result = classifier.classify(humans)
    expect(result.length).to be(3)
    expect(result[0]['score']).to be(1.0)
  end
end
