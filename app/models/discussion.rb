class Discussion < ApplicationRecord
  belongs_to :user
  has_one :coop, through: :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :date, presence: true
  validates :coop_id, presence: true
end
