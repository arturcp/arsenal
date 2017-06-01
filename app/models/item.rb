class Item < ApplicationRecord
  mount_uploader :image_url, ImageUploader

  belongs_to :campaign

  def price_for_current_amount
    current_amount * price
  end
end
