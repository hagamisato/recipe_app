class CreateFavorits < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites, id: false do |t|
      t.column :favorite_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'

      t.references :recipe
      t.references :user
      t.timestamps
    end
  end
end
