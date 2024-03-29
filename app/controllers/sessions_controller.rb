class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # если нажали на чекбокс, то запоминаем иначе забываем дайджест запоминания 
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # перенаправляем на предыдущую сохраненную локацию пользователя либо на дефолтную страницу 
      redirect_back_or user
    else
      flash.now[:danger] = 'Неверный майл или пароль'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
