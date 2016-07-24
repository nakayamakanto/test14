class RenameUiDtoUserId < ActiveRecord::Migration
  def change
    rename_column :pictures, :uid, :user_id
  end
end
