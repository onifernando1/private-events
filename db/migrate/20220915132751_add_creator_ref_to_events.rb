class AddCreatorRefToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :creator
  end
end
