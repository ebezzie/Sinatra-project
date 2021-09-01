class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :description
      t.string :ingredients
      t.integer :user_id
    end
  end
end
