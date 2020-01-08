class Souvenir < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :photo, presence: true
  has_one_attached :photo
end
