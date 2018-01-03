class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @cruds = Crud.all.order('created_at DESC')
  end

  def show
    @locations = @crud.locations.order( 'created_at ASC' )
  end

  end
end


private
  def crud_params
    params.require(:crud).permit(:crud_name)
  end

  def set_trip
    @crud = Crud.find(params[:id])
  end
end
