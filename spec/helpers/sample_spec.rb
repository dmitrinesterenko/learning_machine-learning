require_relative '../spec_helper'
describe C::Sample do
  let(:sample) { C::Sample.new }

  it '.generate' do
    s = sample.generate(10)
    expect(s.length).to be(10)
  end
end
