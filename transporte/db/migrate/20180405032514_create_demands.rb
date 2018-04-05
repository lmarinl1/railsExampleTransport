class CreateDemands < ActiveRecord::Migration[5.1]
  def change
    create_table :demands do |t|
      t.string :category, null: false
      t.string :plate,  null:false
      t.boolean :score, null: false
      t.text :comment, null: true

      t.timestamps
    end
  end
end
