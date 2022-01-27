class CreateFridgs < ActiveRecord::Migration[6.0]
  def change
    create_table :fridgs, id: false do |t|
      t.column :fridge_material_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.string :nm_fridge_mtrl,           null: false, default: "", maxlength: "20"
      t.string :amnt_fridge_mtrl,         default: "", maxlength: "20"
      t.string :mtrl_expirationday,       default: "", maxlength: "20"

      t.references :recip
      t.timestamps
    end
  end
end
