class AddFileDescriptionToDataFile < ActiveRecord::Migration
  def change
    add_column :data_files, :description, :string
  end
end
