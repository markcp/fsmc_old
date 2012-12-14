FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    name "Mark Pittillo"
    email
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end

