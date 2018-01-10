class TopsController < ApplicationController
  def index
    @twitters = Twitter.all
  end
end