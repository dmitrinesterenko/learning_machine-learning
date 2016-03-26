require_relative '../spec_helper'

describe Learners::Spaces do
  let(:trainer) do
    #TODO: this pattern stinks can you change this so that
    # the initialize and populate and return are all one operation?
    C::Trainer.new DataSets::Names.data
  end

  subject(:learner) do
    Learners::Spaces.new trainer.all
  end

  describe '.analyze' do
    context 'knows' do
     it 'that a single space equal humans' do
       expect(learner.analyze("Bob Chunky")).to eq 1.0
     end

     it 'that xkc3po is non-human' do
       expect(learner.analyze('xkc3po')).to eq 0.0
     end

    it 'that Michal K Mitchell III is human' do
      expect(learner.analyze('Michael K Mitchell III')).to eq 0.8
    end

     it 'that an excessive amount of spaces is an indicator that this is not a human' do
       expect(learner.analyze("Bob Chunk Greenwalsh Blue Memories")).to eq 0.4
     end
    end

    context 'does not know' do
      it 'that a persons name can be without spaces' do
       expect(learner.analyze("Anne")).to be 0.0
      end
    end
  end

end
