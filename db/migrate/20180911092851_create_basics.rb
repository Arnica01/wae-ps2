class CreateBasics < ActiveRecord::Migration[5.1]
  def change
    create_table :basics do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :references

      t.timestamps
    end
  end
end
