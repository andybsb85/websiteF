class SessionsController < Devise::SessionsController
  def new
      super
  end

	def create
    super
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
