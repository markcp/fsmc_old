require 'spec_helper'

describe Performance do

  before { @performance = Performance.new( person_id: 1, movie_id: 1, role_id: 1) }

  subject { @performance }

  it { should respond_to(:person_id) }
  it { should respond_to(:movie_id) }
  it { should respond_to(:role_id) }

  it { should be_valid }

  describe "when person_id is not present" do
    before { @performance.person_id = nil }
    it { should_not be_valid }
  end

  describe "when movie_id is not present" do
    before { @performance.movie_id = nil }
    it { should_not be_valid }
  end

  describe "when role_id is not present" do
    before { @performance.role_id = nil }
    it { should_not be_valid }
  end

end
