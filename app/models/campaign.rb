class Campaign < ApplicationRecord
  has_many :items
  has_many :orders
  has_many :campaign_news

  validates :name, presence: true

  scope :to_display, -> { where(display: true) }
  scope :opened, ->(current_date = Time.zone.now) do
    where("? >= start_date AND ? <= end_date", current_date.beginning_of_day, current_date.end_of_day)
  end

  scope :closed, ->(current_date = Time.zone.now) do
    where("? < start_date OR ? > end_date", current_date.beginning_of_day, current_date.end_of_day)
  end

  TERMOMETER = 0
  CIRCULAR_PROGRESS = 1

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

  def finished?
    end_date < Time.zone.now
  end
end
