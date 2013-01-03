class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :name
      t.datetime :start_voting_at
      t.datetime :end_voting_at
      t.datetime :start_results_display_at

      t.timestamps
    end
  end
end
