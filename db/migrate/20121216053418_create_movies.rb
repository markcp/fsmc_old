class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year_id
      t.string :director_display
      t.string :screenwriter_display
      t.string :title_sort

      t.timestamps
    end
    add_index :movies, [ :title, :year_id ]
  end
end
