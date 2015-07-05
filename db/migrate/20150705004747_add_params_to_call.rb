class AddParamsToCall < ActiveRecord::Migration
  def change
    add_column :calls, :params, :text
  end
end
