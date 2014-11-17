class DemandUser < ActiveRecord::Base

  validates :info, presence: true

  belongs_to :demand
  belongs_to :user
end
