require_relative '../spec_helper'

describe Learners::Ngram do
  let(:trainer) do
    C::Trainer.new DataSets::Humans.data
  end

  let(:small_data_set) do
    trainer.data[0]
  end

  subject(:learner) do
    Learners::Ngram.new 2, trainer.data
  end

  describe '.ngram' do
    context 'when there is scored data' do
      it 'generates an ngram' do
        expect(learner.ngram(small_data_set)).to eq({"an"=>1.0, "de"=>1.0,
"rs"=>1.0, "on"=>1.0, " c"=>1.0, "oo"=>1.0, "pe"=>1.0})
      end
    end

    context 'when there is unscored data' do
      it 'generates an ngram' do
        expect(learner._ngram("Walter Disney")).to eq(["wa", "lt", "er", " d",
"is", "ne"])
      end
    end
  end


  describe '.analyze' do
    context 'knows that' do
     it 'anderson is a human' do
       learner.ngram(small_data_set)
       expect(learner.analyze("anderson")).to be 1.0
     end

     xit 'li is a human' do
       expect(learner.analyze('david li')).to be 1.0
     end
    end

    context 'does not know that' do
      xit 'amaranth is not a human' do
       expect(learner.analyze("amaranth")).to be 0.0
      end
    end
  end

end
