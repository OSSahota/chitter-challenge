class CreatePeep < ActiveRecord::Migration[5.2]
  def change
    create_table :peep do |p|
      p.string :text
      p.timestamps
    end
  end
end
