class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.text :description
      t.integer :status
      t.text :embeded_video

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
