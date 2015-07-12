# encoding: UTF-8
require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => "mysql2",
    :host => "192.168.33.10",
    :username => "root",
    :password => "root",
    :database => "test"
)

class User < ActiveRecord::Base
end

ActiveRecord::Migration.create_table :users do |t|
  t.string :name
end

class App < Sinatra::Application
end

get '/' do
  @users = User.all
  @users.to_json

end

post '/' do
  user = User.create(:name => params[:name])
  user.save
end