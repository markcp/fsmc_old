class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :skandies_year
      t.string :director
      t.string :title_sort
      t.boolean :short

      t.timestamps
    end
    add_index :movies, [ :title, :year, :skandies_year, :director ]
  end
end
