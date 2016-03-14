require_relative 'spec_helper'

describe C::Trainer do
  let(:humans) do
    ["Anderson Cooper":1.0,
     "Andy Anderson": 1.0,
     "Megan Melody": 1.0,
     "Buzzy": 0.2,
     "S1243": 0.1,
     "chair": 0.1]
  end

  let(:trainer) do
    C::Trainer.new(humans)
  end

  it "trains to understand humans" do
    expect(trainer.trained?).to be(true)
  end
end
