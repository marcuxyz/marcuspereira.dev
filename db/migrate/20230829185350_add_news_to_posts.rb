class AddNewsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :news, :boolean
  end
end
