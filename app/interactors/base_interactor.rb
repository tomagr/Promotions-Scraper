# frozen_string_literal: true

class BaseInteractor
  include ErrorRaiser

  def tickets_url
    "https://experienciasblack.lanacion.com.ar/"
  end

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
end
