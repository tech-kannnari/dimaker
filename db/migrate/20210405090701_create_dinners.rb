class CreateDinners < ActiveRecord::Migration[6.0]
  def change
    create_table :dinners do |t|
      t.text       :impression, null: false
      t.date       :cookday,    null: false
      t.references :user,       null: false, foreign_key:true
      t.timestamps
    end
  end
end
