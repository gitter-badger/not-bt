class Report < ActiveRecord::Base
  validates :address, presence: true
  validates :category, presence: true
end
