class Interactor
	include ActiveModel::Validations
	include ErrorRaiser
	include ApplicationHelper


	private

	def raise_invalid_user_repository
		raise 'Invalid Users\'s repository'
	end

	def raise_invalid_repository
		raise 'Invalid repository'
	end

end