class Campaign < ApplicationRecord
  mount_uploader :main_image_url, ImageUploader

  has_many :items
  has_many :orders
  has_many :campaign_news, -> { order('created_at desc') }
  has_many :campaign_messages, -> { order('status, created_at desc') }

  validates :name, presence: true

  scope :to_display, -> { where(display: true) }
  scope :opened, lambda { |current_date|
    date = current_date || Time.zone.now
    where("? >= start_date AND ? <= end_date", date.beginning_of_day, date.end_of_day)
  }

  scope :closed, lambda { |current_date|
    date = current_date || Time.zone.now

    where("? < start_date OR ? > end_date", date.beginning_of_day, date.end_of_day)
  }

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
      sum + item.target * item.price
    end
  end

  def current_amount
    items.reduce(0) do |sum, item|
      sum + item.current_amount * item.price
    end
  end

  def finished?
    end_date < Time.zone.now
  end

  def messages_by_status(status: nil)
    campaign_messages.where(status: status)
  end
end
