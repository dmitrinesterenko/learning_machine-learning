require_relative '../spec_helper'

describe Learners::Dunce do
  let(:trainer) do
    t = C::Trainer.new
    t.train(DataSets::Names.data)
    t
  end

  subject(:learner) do
    Learners::Dunce.new trainer.all
  end

  describe '.learn' do
    it 'learns nothing from the training' do
      learner.learn
      expect(learner.analyze("Bob Hope")).to eq(0.0)
    end
  end
end
