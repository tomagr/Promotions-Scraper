class SaveEntries < BaseInteractor

	@@last_id = 0

	def self.save(xml_entries:)

		new(xml_entries: xml_entries).execute
	end

	def initialize(xml_entries:)
		@xml_entries = xml_entries
	end

	def execute
		invalid_xml_entries @xml_entries
		analyze_and_save
	end

	private

	def analyze_and_save
		@xml_entries.each do |xml_entry|
			last_id = SaveEntry.by(xml_entry: xml_entry, last_id: @@last_id)
			@@last_id = last_id
		end
	end

end
