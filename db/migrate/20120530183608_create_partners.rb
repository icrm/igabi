class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :short_description
      t.binary :description
      t.string :path_first_image
      t.string :path_second_image
      t.boolean :active

      t.timestamps
    end
  end
end
