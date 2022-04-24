# letters_spec.rb
require 'rspec'
require 'pry'
require './lib/letters'

describe Letters do
  it 'exists' do
    alphabet = Letters.new

    expect(alphabet).to be_an_instance_of Letters
    expect(alphabet.letters.class).to eq Hash
  end

  it 'can print certain letters' do
    alphabet = Letters.new

    expect(alphabet.letters[:a]).to eq({
                                         1 => ['O', '.'],
                                         2 => ['.', '.'],
                                         3 => ['.', '.']
                                       })
    expect(alphabet.letters[:g]).to eq({
                                         1 => ['O', 'O'],
                                         2 => ['O', 'O'],
                                         3 => ['.', '.']
                                       })
  end

    it 'can print just the values' do
      alphabet = Letters.new

      expect(alphabet.letters[:a].values).to eq [['O', '.'],
                                                 ['.', '.'],
                                                 ['.', '.']]
  end
end
