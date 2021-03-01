class CreateNonprofits < ActiveRecord::Migration[6.0]
  def change
    create_table :nonprofits do |t|
      t.string :name
      t.string :city
    end
  end
end
