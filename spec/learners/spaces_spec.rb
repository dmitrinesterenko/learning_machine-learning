require_relative '../spec_helper'

describe Learners::Spaces do
  let(:trainer) do
    #TODO: this pattern stinks can you change this so that
    # the initialize and populate and return are all one operation?
    t = C::Trainer.new
    t.train(DataSets::Humans.data)
    t
  end

  subject(:learner) do
    l =  Learners::Spaces.new
    l.learn(trainer.all)
    l
  end

  describe '.learn' do
    context 'it succeeds at the problem' do
     it 'learns that a single space equal humans' do
       expect(learner.analyze("Bob Chunky")).to eq(1.0)
     end

     it 'learns that any number of spaces equals to a human' do
       expect(learner.analyze("Bob Chunky Greenwalsh Blue Memories")).to eq(1.0)
     end

     xit 'learns that any number of spaces if often a lie and a non human' do
       expect(learner.analyze("Bob Chunk Greenwalsh Blue Memories")).to lt(1.0)
     end
    end

    context 'it fails at the problem' do
      it 'misses that a persons name can be without spaces' do
       binding.pry
       expect(learner.analyze("Anne")).to eq(0.0)
      end
    end
  end

end
