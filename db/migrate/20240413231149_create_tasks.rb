class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :description, limit: 200
      t.boolean :completed
      t.string :subtype, limit: 20

      t.timestamps
    end
  end
end
