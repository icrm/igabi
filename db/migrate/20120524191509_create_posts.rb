class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.binary  :sumary
      t.binary  :post 
      t.boolean :active

      t.timestamps
    end
  end
end
