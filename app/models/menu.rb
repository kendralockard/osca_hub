class Menu < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :starch, presence: true
  validates :protein, presence: true
  validates :vegetable, presence: true
  validates :restrictions, presence: true
end
