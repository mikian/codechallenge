require 'rspec'
require './lib/parser'

describe Parser do
  let(:file) { StringIO.new("/help_page 126.318.035.038\n/contact 184.123.665.067\n/help_page 126.318.035.038")}

  it 'parses correctly' do
    parser = Parser.new(file)
    expect(parser.parse).to eq(parser)
  end

  it 'results visits' do
    parser = Parser.new(file)
    parser.parse

    expect(parser.result[:visits]).to eq([['/help_page', 2], ['/contact', 1]])
  end

  it 'results unique views' do
    parser = Parser.new(file)
    parser.parse

    expect(parser.result[:unique]).to eq([['/contact', 1], ['/help_page', 1]])
  end
end
