class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :original
      t.string :shortened
      t.string :slug

      t.timestamps
    end
    add_index :links, :slug
  end
end
