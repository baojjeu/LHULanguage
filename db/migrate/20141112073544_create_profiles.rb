class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :nickname
      t.integer :gender, default: 0
      t.text :description
      t.timestamps
    end

    remove_column :users, :name
  end
end
