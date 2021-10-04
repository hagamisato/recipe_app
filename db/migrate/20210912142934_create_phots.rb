class CreatePhots < ActiveRecord::Migration[6.0]
  def change
    create_table :photos, id: false do |t|
      t.column :photo_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'

      t.references :recipe
      t.timestamps
    end
  end
end
