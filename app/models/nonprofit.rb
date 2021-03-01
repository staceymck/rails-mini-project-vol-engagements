class Nonprofit < ApplicationRecord
  has_many :volunteer_engagements
  has_many :volunteers, through: :volunteer_engagements
end