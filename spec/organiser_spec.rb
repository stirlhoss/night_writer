# organiser_spec.rb
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
      org.arrange_braille(message)

      expect(org.arrange_print(message).class).to eq String
    end
  end
end
