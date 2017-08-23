class HomeController < ApplicationController
  def index
    render file: Rails.root.join('public', 'myrecipeclient', 'index.html'), layout: false
  end
end
