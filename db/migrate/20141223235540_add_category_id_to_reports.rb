class AddCategoryIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :category_id, :integer
    remove_column :reports, :category, :string
  end
end
