class Category < ActiveRecord::Base
  has_many :reports,
    inverse_of: :category
  validates :name, presence: true
end
