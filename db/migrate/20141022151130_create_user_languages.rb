class CreateUserLanguages < ActiveRecord::Migration
  def change
    create_table :user_languages do |t|
      t.belongs_to :user, index: true
      t.belongs_to :language, index: true

      t.timestamps
    end
  end
end
