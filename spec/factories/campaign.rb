# This will guess the User class
FactoryGirl.define do
  factory :christmas do
    name 'Natal'
    description 'Vamos celebrar um natal único, um Natal Na Rua. '
    start_date Date.parse(2016, 11, 15)
    end_date Date.parse(2016, 12, 25)
    campaign_type 1
  end
end
