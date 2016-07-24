class PicturesRenameUrLtoImage < ActiveRecord::Migration
  def change
    rename_column :pictures, :url, :image
  end
end
