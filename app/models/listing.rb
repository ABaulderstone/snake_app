class Listing < ApplicationRecord
  belongs_to :breed
  belongs_to :user
  enum sex: { female: 0, male: 1 }
  validates :title, :breed_id, :sex, :price, :city, :state, :date_of_birth, presence: true
  has_one_attached :picture
  has_one :order
end
