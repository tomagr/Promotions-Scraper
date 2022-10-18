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

  def invalid_xml_entry xml_entry
    invalid :xml_entry, 'xml_entry cant be nil' if xml_entry.blank?
  end


  def invalid_xml_entries xml_entries
    invalid :xml_entries, 'xml_entries cant be nil' if xml_entries.blank?
  end

end
