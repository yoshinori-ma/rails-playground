class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    # create_table :plans, id: :uuid do |t|
    create_table :plans do |t|
      t.string :uuid, null: false, index: true, unique: true
      t.string :name, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
