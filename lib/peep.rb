require 'sinatra'
require 'sinatra/activerecord'

class Peep < ActiveRecord::Base
  self.table_name = "peep"

  belongs_to :account

end
