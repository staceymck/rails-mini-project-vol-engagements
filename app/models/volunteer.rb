class Volunteer < ApplicationRecord
  has_many :volunteer_engagements
  has_many :nonprofits, through: :volunteer_engagements
end