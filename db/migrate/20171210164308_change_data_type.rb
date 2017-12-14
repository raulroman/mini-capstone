class ChangeDataType < ActiveRecord::Migration[5.1]
    #change description data type from string to text
  def change
    change_column :products, :description, :text
  end
end
