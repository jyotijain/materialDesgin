class WelcomeController < ApplicationController
 # before_action :set_sorConnection, only: [:Index]
  def index
    @solr = RSolr.connect url: 'http://192.168.1.150:8974/solr/RestraInfo'
    @response = @solr.get 'select', :params => {:q =>"*:*",:indent => true,:start=>0,:rows=>200}
     @TotalRecFound=@response["response"]["numFound"].to_i
     gon.AllRecords=@response["response"]["docs"]
  end
  def sendMail
    @user=params[:email]

    User.send_signup_email(@user).deliver
    render :json => {:sent=>"yes"}
  end
  private
  def set_sorConnection
    @solr = RSolr.connect url: 'http://192.168.1.150:8974/solr/RestraInfo'
    end
end
