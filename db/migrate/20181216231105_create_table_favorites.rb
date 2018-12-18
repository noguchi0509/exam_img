class CreateTableFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
    end
  end
end
