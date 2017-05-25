class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.date :start_date
      t.date :end_date
      t.text :employer
      t.text :location
      t.text :reason
      t.text :description
      t.text :position

      t.timestamps
    end
  end
end
