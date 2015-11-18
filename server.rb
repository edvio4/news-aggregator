require 'sinatra'
require 'csv'
require 'pry'

get '/articles' do
  @articles = CSV.read("public/articles.csv")
  # binding.pry
  erb :articles
end

get '/articles/new' do
  erb :new
end

post '/articles/new' do
  article = params.values
  CSV.open("public/articles.csv", "a") do |csv|
    csv << article
  end
  redirect '/articles'
end
