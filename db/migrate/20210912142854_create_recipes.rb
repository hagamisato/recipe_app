class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes, id: false do |t|
      t.column :recipe_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.string :title,              null: false, default: "", maxlength: "40"
      t.text :explain,              maxlength: "200"
      t.integer :is_browsable,      null: false, default: 0
      t.string :conversion_title,   null: false, default: "", maxlength: "80" 
      t.references :user,        foreign_key: true

      t.timestamps
    end
  end
end
