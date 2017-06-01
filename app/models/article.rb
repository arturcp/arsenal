class Article < ApplicationRecord
  self.per_page = 5

  mount_uploader :main_image_url, ImageUploader
end
