class AddApplicantInfoToDemandUsers < ActiveRecord::Migration
  def change
    add_column :demand_users, :info, :text
  end
end
