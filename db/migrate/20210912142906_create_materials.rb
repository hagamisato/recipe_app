class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials, id: false do |t|
      t.column :material_id,          'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.string :nm_material,          null: false, default: "", maxlength: "40"
      t.string :amnt_material,        null: false, default: "", maxlength: "40"
      t.string :convert_material,     null: false, default: "", maxlength: "80"

      t.references :recipe
      t.timestamps
    end
  end
end
