class Admin::DashboardController < ApplicationController

  #Come back and DRY this up
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']

  def show
  end
end
