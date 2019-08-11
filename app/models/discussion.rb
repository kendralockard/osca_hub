class Discussion < ApplicationRecord
  belongs_to :user
  has_one :coop, through: :user
  default_scope -> { order(meal: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :coop_id, presence: true
end
