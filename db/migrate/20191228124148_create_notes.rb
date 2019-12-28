class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :is_completed

      t.timestamps
    end
  end
end
