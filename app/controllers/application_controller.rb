class ApplicationController < ActionController::API
  before_action :underscore_params!
  rake db:drop db:create db:migrate db:seed
  respond_to :json


  private

  def underscore_params!
      params.deep_transform_keys!(&:underscore)
  end
end
