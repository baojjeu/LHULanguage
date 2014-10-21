class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.text :description
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
