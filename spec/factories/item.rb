# This will guess the User class
FactoryGirl.define do
  factory :bread, class: Item do
    association :campaign, factory: :christmas
    name 'Pão'
    image_url 'https://kingofwallpapers.com/bread/bread-005.jpg'
    price 2.0
  end

  factory :wine, class: Item do
    association :campaign, factory: :christmas
    name 'Vinho'
    image_url 'http://www.brechando.com/wp-content/uploads/2016/05/vinho.jpg'
    price 5.0
  end
end
