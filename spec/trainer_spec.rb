require_relative 'spec_helper'

describe C::Trainer do
  let(:humans) do
    {"Anderson Cooper":1.0,
     "Andy Anderson": 1.0,
     "Megan Melody": 1.0,
     "Buzzy": 0.2,
     "S1243": 0.1,
     "chair": 0.1
    }
  end

  let(:buzz_aldrin) do
    {"Buzzy": 1.0}
  end

  let(:new_record) do
    {"Bobby Smurda": 1.0}
  end

  subject(:trainer) do
    C::Trainer.new
  end

  describe ".train" do
    it "trains to understand humans" do
      expect(trainer.train(humans)).to eq(humans)
    end

    it "adds new humans" do
      trainer.train(humans)
      trainer.train(new_record)
      expect(trainer.all).to eq(humans.merge(new_record))
    end

    it "adjusts with feedback" do
      expect(trainer.train(buzz_aldrin)).to match(buzz_aldrin)
      expect(trainer.get("Buzzy")).to eq(1.0)
    end
  end
end
