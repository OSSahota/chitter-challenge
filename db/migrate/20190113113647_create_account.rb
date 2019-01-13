class CreateAccount < ActiveRecord::Migration[5.2]
  def change
    create_table :account do |a|
      a.string :email
      a.string :password
      a.string :name
      a.string :username
    end
  end
end
