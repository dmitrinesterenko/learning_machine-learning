require_relative '../spec_helper'

describe Learners::Ngram do
  let(:trainer) do
    C::Trainer.new DataSets::Names.data
  end

  #TODO: mystery guest
  let(:small_data_set) do
    trainer.data[0]
  end

  subject(:learner) do
    Learners::Ngram.new 2, trainer.data
  end

  describe '.ngram' do
    context 'when there is scored data' do
      it 'generates an ngram' do
        expect(learner.ngram(small_data_set)).to include({"an"=>1.0, "de"=>1.0,
"rs"=>1.0, "on"=>1.0, " c"=>1.0, "oo"=>1.0, "pe"=>1.0})
      end
    end
  end

  describe '._ngram' do
    context 'when there is unscored data' do
      it 'generates an ngram' do
        expect(learner._ngram("Walter Disney")).to eq(["wa", "lt", "er", " d",
"is", "ne"])
      end
    end
  end


  describe '.analyze' do
    context 'during small batch training' do
     it 'knows that anderson is definitely a human' do
       learner.ngram(small_data_set)
       expect(learner.analyze("anderson")).to eq 1.0
     end
    end

    context 'during regular training' do
     it 'knows that anderson is likely a human' do
       expect(learner.analyze("anderson")).to eq 0.875
     end

     it 'david li does not score highly as a human' do
       expect(learner.analyze('david li')).to eq 0.125
     end

     it 'amaranth scores higher as a human' do
       expect(learner.analyze("amaranth")).to eq 0.375
     end
    end
  end

end
