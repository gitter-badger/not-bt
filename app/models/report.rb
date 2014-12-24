class Report < ActiveRecord::Base
  belongs_to :category,
    inverse_of: :reports

  validates :address, presence: true
  validates :category_id, presence: true
  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader
end
