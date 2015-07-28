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

class App < Sinatra::Application
end

get '/users' do
  users = User.all
  users.to_json

end

post '/users' do
  user = User.create(:name => params[:name])
  user.save
end

get '/users/:id' do
  user = User.find(params[:id])
  user.to_json
end