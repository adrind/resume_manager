class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.text :name
      t.integer :year
      t.text :level

      t.timestamps
    end
  end
end
