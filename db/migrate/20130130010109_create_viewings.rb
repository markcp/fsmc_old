class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.integer :movie_id
      t.date :date
      t.integer :format_id
      t.string :grade
      t.text :notes

      t.timestamps
    end
  end
end
