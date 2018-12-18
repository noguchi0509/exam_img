class ChangeUserIdColumnsOnFavorites < ActiveRecord::Migration[5.1]
  def change
        remove_column(:favorites, :user_id)
        remove_column(:favorites, :post_id)
  end
end
