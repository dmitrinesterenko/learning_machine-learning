require_relative 'spec_helper'
describe C::IO do
  let(:file) { 'test_file.csv'}
  let(:data) { ['0.5', '0.6', '0.99'] }
  let(:output) { C::IO.new }

  it '.output' do
    output.output(file, data)
    file_out = File.read(file)
    expect(file_out.length > 0).to be(true)
  end
end
