require 'rspec'
require_relative '../capitalize_decorative'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Decorator', correct_name: 'john doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name provided by the nameable object' do
      expect(decorator.correct_name).to eq('John Doe') # Capitalize "John" and "Doe"
    end
  end
end
