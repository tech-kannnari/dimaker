class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string     :main_name,    null: false
      t.text       :main_recipe,  null: false  
      t.string     :main_genre    
      t.string     :salad_name,   null: false  
      t.text       :salad_recipe, null: false   
      t.string     :salad_genre    
      t.string     :soup_name,    null: false
      t.text       :soup_recipe,  null: false   
      t.string     :soup_genre   
      t.references :user,         null: false, foreign_key:true
      t.timestamps
    end
  end
end
