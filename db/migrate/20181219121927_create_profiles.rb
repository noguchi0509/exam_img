class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.text :profilepic
      t.text :introduction
      t.date :birthday
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
