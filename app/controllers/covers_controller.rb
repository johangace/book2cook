class CoversController < ApplicationController

  def index
    @covers = current_user.covers
  end

  def new
    @cover = current_user.covers.new
  end

  
end



