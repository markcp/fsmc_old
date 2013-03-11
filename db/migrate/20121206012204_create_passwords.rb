class CreatePasswords < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end
