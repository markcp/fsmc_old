FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    first_name "Mark"
    last_name "Pittillo"
    email
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :year do
    name "2012"
    start_voting_at "2013-01-01 00:00:01"
    end_voting_at "2013-01-31 06:00:00"
    start_results_display_at "2013-03-01 00:00:01"
  end

  factory :movie do
    title "Holy Motors"
    director_display nil
    screenwriter_display nil
    year
  end
end
