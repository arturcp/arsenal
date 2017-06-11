FactoryGirl.define do
  factory :christmas, class: Campaign do
    name 'Natal'
    description "Vamos celebrar um Natal único, um Natal nas ruas.\n Venha celebrar com a gente."
    start_date Date.parse('2016-11-15')
    end_date Date.parse('2016-12-25')
    campaign_type 0

    trait :enabled do
      display true
    end

    trait :disabled do
      display false
    end
  end

  factory :easter, class: Campaign do
    name 'Páscoa'
    description 'Páscoa é tempo de chocolates!'
    start_date Date.parse('2017-11-15')
    end_date Date.parse('2017-12-25')
    campaign_type 1
  end

  factory :church, class: Campaign do
    name 'Reforma da igreja'
    description 'Precisamos de sua ajuda para reformar a igreja'
    start_date Date.parse('2015-11-15')
    end_date Date.parse('2015-12-25')
    campaign_type 1
  end
end
