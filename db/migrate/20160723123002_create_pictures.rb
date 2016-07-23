class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :url
      t.integer :uid
      t.text :content

      t.timestamps null: false
    end
  end
end
