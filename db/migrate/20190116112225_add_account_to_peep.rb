class AddAccountToPeep < ActiveRecord::Migration[5.2]
  def change
    add_reference :peep, :account, index: true
  end
end
