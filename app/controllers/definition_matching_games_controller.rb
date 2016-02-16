class DefinitionMatchingGamesController < ApplicationController
  def new
    @definition_matching_game = DefinitionMatchingGame.new
  end
  
  def create
    @definition_matching_game = DefinitionMatchingGame.new(definition_matching_game_params)
    #@definition_matching_game.link_to_words
    if @definition_matching_game.save
      redirect_to @definition_matching_game
    else
      render 'new'
    end 
  end

  def show
    @definition_matching_game = DefinitionMatchingGame.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = DefinitionMatchingGamePdf.new(@definition_matching_game)
        send_data pdf.render,
                  filename: "definition_matching_game#{@definition_matching_game.id}.pdf",
                  type: 'application/pdf'
      end
    end 
  end

  def update
    @definition_matching_game = DefinitionMatchingGame.find(params[:id])
    @definition_matching_game.update_attributes(definition_matching_game_params)
    @definition_matching_game.link_to_words
    redirect_to @definition_matching_game
  end

  def edit 
    @definition_matching_game = DefinitionMatchingGame.find(params[:id])
  end



  private
  def definition_matching_game_params
    params.require(:definition_matching_game).permit(:title,:vocab_list,word_ids:[])
  end

  


end
