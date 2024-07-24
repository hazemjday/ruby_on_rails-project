class Home < ApplicationRecord
  has_many :comments,  dependent: :destroy
  validates :image, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :size, presence: true
  validates :price, presence: true
end
