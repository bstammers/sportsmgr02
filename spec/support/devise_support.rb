module ValidUserControllerHelper
  def valid_user_sign_in
    @user ||= FactoryGirl.create(:admin_user)
    sign_in @user
  end
end
module ValidUserFeatureHelper
  include Warden::Test::Helpers
  Warden.test_mode!
  def valid_user_sign_in
    @user ||= FactoryGirl.create(:admin_user)
    login_as(@user, scope: :user)
  end
end

RSpec.configure do |config|
  config.include ValidUserControllerHelper, type: :controller
  config.include ValidUserFeatureHelper, type: :feature
end
