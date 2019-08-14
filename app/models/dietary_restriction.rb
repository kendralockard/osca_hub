class DietaryRestriction < ApplicationRecord
  belongs_to :user
  has_one :coop, through: :user
  validates :coop_id, :presence => {message: ": You must be in a co-op to add your dietary restrictions."}, allow_nil: false
end
