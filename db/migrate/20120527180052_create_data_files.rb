class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string  :name
      t.string  :path
      t.integer :file_type

      t.timestamps
    end
  end
end
