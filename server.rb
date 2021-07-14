require 'sinatra'
require_relative 'Contact'

get '/' do
    redirect to('/home')
end

get '/home' do
    @title="home"
    @num=Contact.count
    @contacts=Contact.all
    erb :home
end

get '/addContact' do
    @title="add contact"
    @contacts=Contact.all
    erb :addContact
end

post '/add' do
    newContact=Contact.new
    newContact.first_name=params["first_name"]
    newContact.last_name=params["last_name"]
    newContact.email=params["email"]
    newContact.note=params["note"]
    newContact.save
    redirect to('/home')
end

get '/editContact/:id' do
    @title="edit"
    @contacts=Contact.all
    @contact=Contact.find(params["id"])
    erb :edit
end

post '/edit/:id' do
    updatee=Contact.find(params["id"])
    updatee.first_name=params["first_name"]
    updatee.last_name=params["last_name"]
    updatee.email=params["email"]
    updatee.note=params["note"]
    updatee.save
    redirect to('/home')
end

get '/deleteContact/:id' do
    @contact=Contact.find(params["id"])
    @contact.delete
    redirect to('/home')
end

get '/about' do
    @title="about"
    erb :about
end