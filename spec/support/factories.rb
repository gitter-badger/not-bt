FactoryGirl.define do
  factory :category do
  end

  factory :report do
  #  category "Streetlight"
    address "33 Harrison Ave, Boston, MA 02111"
    description "The streetlight is out. Public safety issue!"
  end
end
