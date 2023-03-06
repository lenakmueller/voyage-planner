class ChangeColumnReturnTransportation < ActiveRecord::Migration[7.0]
  def change
    remove_column :transportations, :return, :string
    add_column :transportations, :return_day, :string
  end
end
