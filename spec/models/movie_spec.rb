# == Schema Information
#
# Table name: movies
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  year          :string(255)
#  skandies_year :string(255)
#  director      :string(255)
#  title_sort    :string(255)
#  short         :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# require 'spec_helper'

# describe Movie do

#   let(:year) { FactoryGirl.create(:year) }
#   before { @movie = year.movies.build( title: "The Master" ) }

#   subject { @movie }

#   it { should respond_to(:title)}
#   it { should respond_to(:year_id)}
#   it { should respond_to(:director_display)}
#   it { should respond_to(:screenwriter_display)}
#   it { should respond_to(:year) }
#   it { should respond_to(:title_sort) }
#   its(:year) { should == year }

#   it { should be_valid }

#   describe "when title is not present" do
#     before { @movie.title = " " }
#     it { should_not be_valid }
#   end

#   describe "when year_id is not present" do
#     before { @movie.year_id = nil }
#     it { should_not be_valid }
#   end

#   describe "title sort" do

#     describe "with 'The'" do
#       before { @movie.title = "The Master" }
#       its(:title_sort) { should == "Master, The"}
#     end

#     describe "with 'A'" do
#       before { @movie.title = "A Separation" }
#       its(:title_sort) { should == "Separation, A" }
#     end

#     describe "with 'An'" do
#       before { @movie.title = "An Education" }
#       its(:title_sort) { should == "Education, An" }
#     end

#     describe "with no article" do
#       before { @movie.title = "Once Upon a Time in Anatolia" }
#       its(:title_sort) { should == "Once Upon a Time in Anatolia" }
#     end
#   end
# end
