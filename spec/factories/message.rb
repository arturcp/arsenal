FactoryGirl.define do
  factory :message_one, class: CampaignMessage do
    order_reference 'f4ed1631-a34f-4dce-8283-7c22038bc457'
    author 'John Doe'
    email 'john.doe@gmail.com'
    message 'Muito sucesso com a campanha!'

    trait :active do
      status true
    end

    trait :inactive do
      status false
    end
  end

  factory :message_two, class: CampaignMessage do
    order_reference 'fdd9771e-a459-4a16-a961-02f2acec2c4b'
    author 'Jane Roe'
    email 'jane.roe@gmail.com'
    message 'Espero que essa contribuição seja o bastante para ajudar vocês a realizar esse sonho.'
    status true
  end
end
