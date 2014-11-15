class ResetUserExperiencedLanguages < ActiveRecord::Migration
  def change
    # http://stackoverflow.com/questions/6732896/does-rename-column-take-care-of-indexes
    rename_column :user_languages, :user_id, :profile_id
    rename_table :user_languages, :profile_languages
  end
end
