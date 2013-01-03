class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :person_id
      t.integer :movie_id
      t.integer :role_id

      t.timestamps
    end
  end
end
