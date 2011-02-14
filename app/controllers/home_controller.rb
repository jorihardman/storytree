class HomeController < ApplicationController
  def index
    @seeds = Seed.order('points DESC').limit(10)
  end

  def about
  end

  def contact_us
  end
end
