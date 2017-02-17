class Campaign < ApplicationRecord
  has_many :items

  validates :name, presence: true

  TERMOMETER = 0
  PYRAMID = 1

  def type_text
    types[self.campaign_type]
  end

  def types
    ['Termômetro', 'Progresso circular']
  end

  def target_value
    items.reduce(0) do |sum, item|
      sum += item.target * item.price
    end
  end

  def current_amount
    items.reduce(0) do |sum, item|
      sum += item.current_amount * item.price
    end
  end
end
