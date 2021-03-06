require_relative '../spec_helper'

describe Learners::SpacesDunce do
  let(:trainer) do
    #TODO: this pattern stinks can you change this so that
    # the initialize and populate and return are all one operation?
    C::Trainer.new DataSets::Names.data
  end

  subject(:learner) do
    l =  Learners::SpacesDunce.new trainer.all
    l.learn
    l
  end

  describe '.analyze' do
    context 'knows' do
     it 'that a single space equal humans' do
       expect(learner.analyze("Bob Chunky")).to be 1.0
     end

     it 'that many number of spaces equals to a human' do
       expect(learner.analyze("Bob Chunky Greenwalsh Blue Memories")).to be 1.0
     end

     it 'that xkc3po is non-human' do
       expect(learner.analyze('xkc3po')).to be 0.0
     end

         end

    context 'does not know' do
      it 'that a persons name can be without spaces' do
       expect(learner.analyze("Anne")).to be 0.0
      end

      it 'that any number of spaces if often a lie and a non human' do
       expect(learner.analyze("Bob Chunk Greenwalsh Blue Memories")).to be 1.0
       end

    end
  end

  describe '.scores?' do
    it 'scores true when the score is more than 0.5' do
      expect(learner.scores?(0.6)).to be true
    end

    it 'scores false when the score is less than or equal to 0.5' do
      expect(learner.scores?(0.5)).to be false
    end
  end

end
