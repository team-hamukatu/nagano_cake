class ChangeColumnsAddBooleanNotnullOnGenres < ActiveRecord::Migration[5.2]
  def change
    change_column :genres, :is_active, :boolean, default: true, null: false
  end
end
