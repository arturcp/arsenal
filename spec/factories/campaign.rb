# This will guess the User class
FactoryGirl.define do
  factory :christmas, class: Campaign do
    name 'Natal'
    description 'Vamos celebrar um Natal único, um Natal nas ruas. '
    start_date Date.parse('2016-11-15')
    end_date Date.parse('2016-12-25')
    campaign_type 1
  end
end
