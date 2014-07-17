class RenameParentPlotFromPlot < ActiveRecord::Migration
  def change
    rename_column :plots, :parent_plot, :parent_plot_id
  end
end
