class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags, id: false do |t|
      t.column :tag_id,          'INTEGER PRIMARY KEY AUTO_INCREMENT'
      t.string :nm_tag,           null: false, default: "", maxlength: "20"

      t.references :recipe
      t.timestamps
    end
  end
end
