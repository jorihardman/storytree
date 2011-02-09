class HomeController < ApplicationController
  def index
    @seeds = Seed.order('points DESC').limit(10)
  end
end
