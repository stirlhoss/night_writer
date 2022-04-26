# organiser_spec.rb
require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require './lib/organiser'

describe Organiser do
  it 'exists' do
    org = Organiser.new

    expect(org).to be_an_instance_of Organiser
    expect(org.org.class).to eq Array
  end

  it 'can report the number of rows it contains' do
   org = Organiser.new

   expect(org.rows).to eq 0

   org.org << Row.make

   expect(org.rows).to eq 1
  end

  it 'can decide how many rows will be needed for the translation' do
    message = "i am just a poor boy and i am from a poor family"
    org = Organiser.new

    expect(org.row_count(message)).to eq 3

  end

  it 'can create a new array that holds all of the rows needed' do
    org = Organiser.new
    org1 = Organiser.new
    message = "here lies the man whos name was writ in hot-dog water"
    another = "xxxxxxxxxxxxxxxxxxxx"
    org.make(message)

    expect(org.rows).to eq 3

    org1.make(another)

    expect(org1.rows).to eq 1
  end

  describe 'arrange_braille' do
    it 'arranges the braille into arrays that can be printed' do
      org = Organiser.new
      message = "here lies the man whos name was writ in hot dog water"
      org.make(message)
      org.arrange_braille(message)

      expect(org.org.class).to eq Array
    end
  end

  describe 'arrange_print' do
    it 'arranges to_print into a format that includes line breaks' do
      org = Organiser.new
      message = "here lies the man whos name was writ in hot dog water"
      org.make(message)

      expect(org.arrange_print(message).class).to eq String
      expect(org.arrange_print(message)).to eq "O.O.O.O...O..OO..O...OO.O...OOO.OO...OO.\nOO.OOO.O..O.O..OO...OOOO.O.......O..OOOO\n....O.....O.....O...O.......O...O....O..\nO..O..OOO.OOO....OO..O...OO..O.O...OOO..\n.OO....O.....O..OO..O...OOOOO.OO..O..O..\nO.O...O...O......O..O....OO...O.....O...\nO.O..O..OOO.OO...OO..OO.O...............\nOO.OOO...O.OOO..OO..OO.OOO..............\n..O.O.....O......O..O...O..............."
    end
  end

  describe 'target math' do
    it 'helps to determine how many lines we will need' do
      text = "here lies the man whos name was writ in hot dog water"
      target = text.length / 20

      expect(target).to eq (2)

      extra_row = text.length % 20

      expect(extra_row).to eq 13

      if extra_row != 0
        target = target + 1
      else
        target

        expect(target).to eq 3
      end
    end
  end
end
