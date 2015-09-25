class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :year, null: false
      t.string :description
      t.string :battery, null: false
      t.belongs_to :manufacturer, index: true
    end
  end
end
