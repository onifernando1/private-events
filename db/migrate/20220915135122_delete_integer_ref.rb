class DeleteIntegerRef < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :creator_id, :integer
  end
end
