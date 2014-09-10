class RoomsController < ApplicationController
  before_filter :config_opentok,:except => [:index]

  def index
  	@rooms = Room.where(:public => true)
  end

  def create
  	session = @opentok.create_session 
		params[:room][:sessionId] = session.session_id

		@new_room = Room.create

		if @new_room.save
			  redirect_to("/party/" +@new_room.id.to_s)
		else
			 render new
			end
  end

  def party
  	@room = Room.find(params[:id])
  end

  def config_opentok
  end

  private
	def config_opentok
		if @opentok.nil?
		@opentok = OpenTok::OpenTok.new '44979352', 'c4b975eed97c2f85866bdc289904ddb84a842a56'
		end
	end
end
