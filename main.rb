# frozen_string_literal: true

require 'sinatra'

def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  nil
end

get '/' do
  erb :welcome
end

get '/:title' do
  page_content params[:title]
end
