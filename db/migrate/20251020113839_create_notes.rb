class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.date :note_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
