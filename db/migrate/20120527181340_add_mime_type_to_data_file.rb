class AddMimeTypeToDataFile < ActiveRecord::Migration
  def change
    add_column :data_files, :mime_type, :string
  end
end
