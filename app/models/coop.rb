class Coop < ApplicationRecord
  has_many :users
  has_many :announcements, through: :users
end
