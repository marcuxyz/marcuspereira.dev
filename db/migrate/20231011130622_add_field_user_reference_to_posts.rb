class AddFieldUserReferenceToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true, default: User.last.id
  end
end
