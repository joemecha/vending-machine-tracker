require 'rails_helper'

RSpec.describe Snack, type: :model do
  before(:each) do

    # add objects here

  end
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should have_many :machine_snacks }
    it { should have_many(:machines).through :machine_snacks }
  end

  describe 'class methods do' do
    describe "#methodname" do

    end
  end

  describe 'instance methods' do
    describe ".methodname"
  end
end
