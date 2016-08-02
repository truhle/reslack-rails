class AddGroupPrefixToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :group_prefix, :string
  end
end
