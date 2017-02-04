class Campaign < ApplicationRecord
  has_many :items

  validates :name, presence: true

  TERMOMETER = 0
  PYRAMID = 1

  def type_text
    types[self.campaign_type]
  end

  def types
    ['Termômetro', 'Pirâmide']
  end
end
