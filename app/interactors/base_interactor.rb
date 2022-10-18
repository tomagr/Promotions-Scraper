# frozen_string_literal: true

class BaseInteractor < Interactor
  include ErrorRaiser

  private

  def raise_invalid_address_repository
    raise 'Invalid Adddresses\'s repository'
  end

  def raise_invalid_company_repository
    raise 'Invalid Company\'s repository'
  end

  def raise_invalid_user_repository
    raise 'Invalid Users\'s repository'
  end

  def raise_invalid_repository
    raise 'Invalid repository'
  end

  def invalid_name name
    invalid :name, 'Name cant be blank' if name.blank?
  end

  def invalid_url url
    invalid :url, 'Url cant be nil' if url.blank?
  end

  def invalid_entry entry
    invalid :entry, 'Entry cant be nil' if entry.nil?
  end

end
