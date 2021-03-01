class CreateVolunteerEngagements < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteer_engagements do |t|
      t.integer :volunteer_id
      t.integer :nonprofit_id
      t.datetime :date
    end
  end
end
