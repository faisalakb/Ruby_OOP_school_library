require 'rspec'
require_relative '../base_decorative.rb' # Adjust the path to match your project structure

# Assuming you have a `Nameable` class or module that the `Decorator` class is based on.

RSpec.describe Decorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  let(:decorator) { Decorator.new(nameable) }

  describe '#initialize' do
    it 'creates a Decorator object with a nameable instance' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates the correct_name method to the nameable instance' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
