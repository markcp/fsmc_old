require 'spec_helper'

describe Role do

  before { @role = Role.new( name: "actor") }

  subject { @role }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @role.name = " " }
    it { should_not be_valid }
  end
end
