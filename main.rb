# frozen_string_literal: true

require 'sinatra'

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  nil
end

def save_content(title, content)
  File.open("pages/#{title}.txt", 'w') do |file|
    file.puts(content)
  end
end

get '/' do
  erb :welcome
end

get '/new' do
  erb :new
end

get '/:title' do
  @title = params[:title]
  @content = page_content(@title)
  erb :show
end

post '/create' do
  save_content(params['title'], params['content'])
  redirect CGI.escape("/#{params['title']}")
end
