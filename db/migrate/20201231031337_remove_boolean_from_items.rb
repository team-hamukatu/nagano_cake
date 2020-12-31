class RemoveBooleanFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :boolean, :boolean
  end
end
