class AddColumnNameToSwotReports < ActiveRecord::Migration
  def change
    add_column :swot_reports, :name, :string
  end
end
