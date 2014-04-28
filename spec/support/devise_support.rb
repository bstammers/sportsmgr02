module ValidUserRequestHelper
  def valid_user_sign_in
    @user ||= FactoryGirl.create(:admin_user)
    sign_in @user
  end
end

RSpec.configure do |config|
  config.include ValidUserRequestHelper, type: :controller
end
