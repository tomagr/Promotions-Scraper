ActiveAdmin.register_page 'Stats' do
	menu priority: 20

	controller do
		def index
		end
	end

	content do
		render :partial => 'charts',
			:locals => {
				:porwer_bi_url => 'https://app.powerbi.com/view?r=eyJrIjoiMWU1ODBmNmUtYWMwOS00MDY4LWIwYjgtZTRjMDNjZDMyMThmIiwidCI6IjQzZjY1ZDI0LWMyODEtNDQ3ZC1hYjQxLTVmODViYjM2NmIxMyIsImMiOjR9',
			}
	end
end
