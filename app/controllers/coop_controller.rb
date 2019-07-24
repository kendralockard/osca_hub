class CoopController < ApplicationController
  def new
    @coop = Coop.new
  end
end
