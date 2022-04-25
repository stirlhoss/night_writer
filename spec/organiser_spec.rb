# organiser_spec.rb
require 'pry'
require 'rspec'
require './lib/organiser'

describe Organiser do
  it 'exists' do
    row = Row.new
    org = Organiser.new(row)

    expect(org).to be_an_instance_of Organiser
    expect(org.org.class).to eq Array
  end

  it 'can create a new array that holds all of the rows needed' do
    row = Row.new
    org = Organiser.new(row)
    message = "here lies the man whos name was writ in hot-dog water"
    org.make(message)

    expect(org.rows).to eq 3
  end
end
