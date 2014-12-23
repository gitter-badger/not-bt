class Report < ActiveRecord::Base
  validates :address, presence: true
  validates :category, presence: true
  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader
end
