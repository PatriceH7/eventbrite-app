class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :only_see_own_page, only: [:show]
  
    def show 
        @user = User.find(params[:id])
        @events = Event.all
    end

    private

    def only_see_own_page
        @user = User.find(params[:id])
      
        if current_user != @user
          redirect_to root_path, notice: "Désolé, mais tu n'es autorisé qu'à voir ta propre page d'utilisateur."
        end
    end
      

#	def new
#		@user = User.new
#	end

#	def create

#		puts "$" * 60
#    	puts "ceci est le contenu de params :"
#    	puts params
#    	puts "$" * 60

#    	@user = User.new(email: params[:email], encrypted_password: params[:password], description: params[:description], first_name: params[:first_name], last_name: params[:last_name])

#		if @user.save
#    	puts "Utilisateur sauvegardé"	
    #  redirect_to gossips_path, notice: "Profil créé, tu vas pouvoir rapporter de nouveaux potins !"
#      UserMailer.with(user: @user).welcome_email.deliver_now

 #   	else
 #     	puts "Nous n'avons pas pu créer ton profil. Voici pourquoi :"
 #     	puts @user.errors.messages
 #    	render'new', alert: "Ton profil utilisateur n'a pas pu être sauvegardé, vois pourquoi ds la notification."
 #   	end
 #   end

end