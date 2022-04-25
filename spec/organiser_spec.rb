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
end
