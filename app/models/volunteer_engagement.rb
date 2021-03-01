class VolunteerEngagement < ApplicationRecord
  belongs_to :nonprofit
  belongs_to :volunteer
end