class RemoveIsAvailableFromDemands < ActiveRecord::Migration
  def change
    remove_column :demands, :is_available
  end
end
