class CreateRememberNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :remember_notes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
