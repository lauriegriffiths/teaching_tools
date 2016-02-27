class NumberChasesController < ApplicationController
  def new
    @number_chase = NumberChase.new
  end
  
  def create
    @number_chase = NumberChase.new(number_chase_params)
    if @number_chase.save
      redirect_to @number_chase
    else
      render 'new'
    end 
  end

  def show
    @number_chase = NumberChase.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = NumberChasePdf.new(@number_chase)
        send_data pdf.render,
                  filename: "number_chase#{@number_chase.id}.pdf",
                  type: 'application/pdf'
      end
    end 
  end

  def update
    @number_chase = NumberChase.find(params[:id])
    @number_chase.update_attributes(number_chase_params)
    redirect_to @number_chase
  end

  def edit 
    @number_chase = NumberChase.find(params[:id])
  end



  private
  def number_chase_params
    params.require(:number_chase).permit(:title,:maximum,:player_count,:turns_per_player)
  end

  


end
