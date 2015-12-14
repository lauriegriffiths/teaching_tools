class VerbMatchingGamesController < ApplicationController
  def new
    @verb_matching_game = VerbMatchingGame.new
  end
  
  def create
    @verb_matching_game = VerbMatchingGame.new(verb_matching_game_params)
    if @verb_matching_game.save
      redirect_to @verb_matching_game
    else
      render 'new'
    end 
  end

  def show
    @verb_matching_game = VerbMatchingGame.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = VerbMatchingGamePdf.new(@verb_matching_game)
        send_data pdf.render,
                  filename: "verb_matching_game#{@verb_matching_game.id}.pdf",
                  type: 'application/pdf'
      end
    end 
  end

  def update
    @verb_matching_game = VerbMatchingGame.find(params[:id])
    @verb_matching_game.update_attributes(verb_matching_game_params)
    redirect_to @verb_matching_game
  end

  def edit 
    @verb_matching_game = VerbMatchingGame.find(params[:id])
  end

  private
  def verb_matching_game_params
    params.require(:verb_matching_game).permit(:verbs)
  end

  

end
