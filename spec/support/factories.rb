FactoryGirl.define do
  factory :category do
  end

  factory :report do
    address "33 Harrison Ave, Boston, MA 02111"
    description "The streetlight is out. Public safety issue!"
  end

  factory :user do
    sequence(:username) { |n| "lizvdk#{n}" }
    sequence(:email) { |n| "liz#{n}@example.com" }
    password "supersecret"
    first_name "Liz"
    last_name "Vdk"
    phone_number "(617) 867-5309"
  end
end
