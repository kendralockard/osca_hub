class Coop < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :announcements, through: :users
  has_many :menus, through: :users
  has_many :events, through: :users
  has_many :discussions, through: :users

  def self.coops
    ["", "Brown Bag", "Fairkid", "Hark", "Keep", "Pyle", "Tank", "TWC"]
  end
end
