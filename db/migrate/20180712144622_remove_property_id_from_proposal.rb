class RemovePropertyIdFromProposal < ActiveRecord::Migration[5.2]
  def change
    remove_reference :proposals, :property_id, foreign_key: true
  end
end
