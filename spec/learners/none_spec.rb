require_relative '../spec_helper'

describe Learners::None do
  let(:trainer) do
    t = C::Trainer.new
    t.train(DataSets::Humans.data)
    t
  end

  subject(:learner) do
    Learners::None.new
  end

  describe '.learn' do
    it 'learns nothing from the training' do
      learner.learn(trainer.all)
      expect(learner.analyze("Bob Hope")).to eq(0.0)
    end
  end
end
