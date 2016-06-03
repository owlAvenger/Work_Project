class InstagrammersController < ApplicationController
require 'google_drive'

	def new  
		@instagrammer = Instagrammer.new
	end

	
	def create
		@instagrammer = Instagrammer.new(instagrammer_params)
		if @instagrammer.save
			session[:instagrammer_id] = @instagrammer.id

			session = GoogleDrive.saved_session("config.json")
			ws = session.spreadsheet_by_key("1u_wNMC29FhD3DiyumS-OIz2DY246ysfGevVooL-7Cc8").worksheets[0]
			last = ws.num_rows + 1
			
			ws[last, 1] = @instagrammer.instagram
			ws[last, 2] = @instagrammer.surname
			ws[last, 3] = @instagrammer.family_name
			ws[last, 4] = @instagrammer.sex
			ws[last, 5] = @instagrammer.age
			ws[last, 6] = @instagrammer.email
			ws[last, 7] = @instagrammer.favorite_brands
			ws[last, 8] = @instagrammer.desired_products
			ws[last, 9] = @instagrammer.other_support
			ws[last, 10] = @instagrammer.newsletter
			ws[last, 11] = @instagrammer.hobbies
			ws[last, 12] = @instagrammer.town
			ws[last, 13] = @instagrammer.job
			ws[last, 14] = @instagrammer.sponsor
			ws[last, 15] = @instagrammer.address
			ws[last, 16] = @instagrammer.introduction
			ws[last, 18] = @instagrammer.favorite_instagrammer

			ws.save

			redirect_to '/'

		else 
			redirect_to '/signup'
		end
	end


	private 
		def instagrammer_params
	params.require(:instagrammer).permit(:instagram, :surname, :family_name, :sex,
										:age, :email, :favorite_brands, :desired_products,
										:other_support, :newsletter, :hobbies, :town, :job,
										:sponsor, :address, :introduction, :favorite_instagrammer)		
		end 
end
