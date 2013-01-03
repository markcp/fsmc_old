require 'spec_helper'

describe Person do

  before { @person = Person.new( first_name: "Denis", last_name: "Levant", gender: "M") }

  subject { @person }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:gender) }

  it { should be_valid }

  describe "when last name is not present" do
    before { @person.last_name = " " }
    it { should_not be_valid }
  end

  describe "when gender is not present" do
    before { @person.gender = " " }
    it { should_not be_valid }
  end

  describe "name computation" do

    describe "when first and last name are present" do
      before do
        @person.first_name = "Denis"
        @person.last_name = "Levant"
      end
      specify { @person.name.should == "Denis Levant" }
    end

    describe "when only last name is present" do
      before do
        @person.first_name = nil
        @person.last_name = "Retta"
      end
      specify { @person.name.should == "Retta" }
    end
  end
end
