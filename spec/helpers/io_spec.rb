require_relative '../spec_helper'

describe Classification::IO do
  ## These methods are taken from https://gist.github.com/JoshCheek/5561023
  def output
    @output_stream.string
  end

  def io(input = "")
    instream = StringIO.new input
    @output_stream = StringIO.new
    described_class.new instream, @output_stream
  end

  it "takes in a score" do
    expect(io("score")).to_not eq nil
  end
end
