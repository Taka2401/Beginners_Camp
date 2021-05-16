# frozen_string_literal: true

module Users
 class Users::SessionsController < Devise::SessionsController

  def guest_sign_in
     user = User.guest
     sign_in user
     redirect_to camps_path, notice: 'ゲストユーザーとしてログインしました。'
  end

 end
end