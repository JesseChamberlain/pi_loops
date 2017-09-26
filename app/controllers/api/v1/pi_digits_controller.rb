class Api::V1::PiDigitsController < ApplicationController

  def index
    loops = 0
    search = search_for_loops
    loops = search
    render json: {loops: loops}
  end

  def search_for_loops
    loops = 10

    return loops
  end
end
