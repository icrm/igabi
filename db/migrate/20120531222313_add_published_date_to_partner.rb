class AddPublishedDateToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :published_date, :date
  end
end
