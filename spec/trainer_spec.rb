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
    C::Trainer.new humans
  end

  describe ".train" do
    it "trains to understand humans" do
      expect(trainer.train(humans)).to eq(humans)
    end

    it "adds new humans" do
      trainer.train(humans)
      prior_count = trainer.all.count
      trainer.train(new_record)
      expect(trainer.all).to eq(humans.merge(new_record))
      expect(trainer.all.count).to eq prior_count + 1
    end

    it "adjusts with feedback" do
      trainer.train(humans)
      expect(trainer.train(buzz_aldrin)).to include(buzz_aldrin)
      expect(trainer.get("Buzzy")).to eq(1.0)
    end

    it "updates existing values" do
      trainer.train(humans)
      prior_count = trainer.data.count
      trainer.train(buzz_aldrin)
      expect(trainer.data.count).to eq prior_count

    end
  end
end
