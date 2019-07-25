class Coop < ApplicationRecord
  has_many :users
  has_many :announcements, through: :users
  has_many :menus, through: :users
end