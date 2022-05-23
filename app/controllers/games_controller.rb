require_relative "../../lib/longest_word"

class GamesController < ApplicationController

  def new
    letters_array = ('A'..'Z').to_a
    @letters = []
    10.times do
      @letters << letters_array.sample
    end
    @start_time = Time.now
  end

  def score

    @end_time = Time.now

    result = run_game(params[:word],JSON.parse(params[:letters]),Time.new(params[:start_time]), @end_time)


    case  result[:message]
      when 1 then @message = " Congratulations! #{params[:word]}  is a valid English word!"
      when 2 then @message = "Sorry but #{params[:word]} does not seem to be a valid English word"
      when 3 then @message = "Sorry but #{params[:word]} can't  built out of #{(JSON.parse(params[:letters])).join(" ")}"
      end
  end

end
