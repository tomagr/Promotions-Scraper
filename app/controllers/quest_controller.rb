class QuestController < ApplicationController

  before_action :set_vars, only: [:validate]

  def index
    @clue = current_clue
    @error = true?(params[:error])
    @error_message = params[:error_message]
  end

  def validate
    @clue = current_clue

    if form_code.capitalize == current_clue.code.capitalize
      @error = false
      @error_message = 'Bien Rooooundie, el codigo es correcto!'
      current_clue.update_attributes!(solved: true)
    end

    redirect_to controller: 'quest', action: 'index', error: @error, error_message: @error_message

  end

  private

  def current_clue
    Level.where(solved: false).order('priority ASC').first
  end

  def form_code
    params['l1'] + params['l2'] + params['l3'] + params['l4'] + params['l5'] + params['l6']
  end

  def set_vars
    @error = true
    @error_message = 'Código incorrecto'
  end

  def true?(obj)
    return nil if obj.nil?
    obj.to_s.downcase == "true"
  end

end
