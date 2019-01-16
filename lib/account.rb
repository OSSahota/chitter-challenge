require 'sinatra'
require 'sinatra/activerecord'

class Account < ActiveRecord::Base
  self.table_name = "account"

  validates :email, :presence => true
  validates :email, :uniqueness => { :message => "This email already exists" }

  validates :password, :presence => true

  validates :name, :presence => true

  validates :username, :presence => true
  validates :username, :uniqueness => { :message => "This username already exists" }

  has_many :peeps

  def self.authenticate(email, password)
    user = find_by(email: email)
    return nil unless user

    if user.password == password
      user
    else
      nil
    end
  end

end
