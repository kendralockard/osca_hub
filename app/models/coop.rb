class Coop < ApplicationRecord
  has_many :users
  has_many :announcements, through: :users
  has_many :menus, through: :users
  has_many :events, through: :users

  def self.coops
    ["", "Brown Bag", "Fairkid", "Harkness", "Keep", "Pyle", "Tank", "TWC"]
  end
end
