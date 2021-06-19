class QuestController < ApplicationController

	def index
		@clue = Level.where(solved: false).order('priority ASC').first
	end

end
