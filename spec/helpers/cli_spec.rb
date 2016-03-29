require_relative '../spec_helper'
require 'aruba'
require 'aruba/api'

describe Classification::CLI do
  ## these testing strategies for CLI are interesting https://gist.github.com/joshcheek/5561023

  let(:stdout) { StringIO.new }
  let(:stdin) { StringIO.new }
  let(:cli) { described_class.new(stdin, stdout) }

  context "when running" do
    it "asks you to provide a name" do
      binding.pry
      expect(cli.name).to eq "Please provide a name?"
    end
  end
end
