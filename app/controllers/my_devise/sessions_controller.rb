class MyDevise::SessionsController < Devise::SessionsController
  # set_flash_message :notice, :signed_in, :name => user.name
  # if is_navigational_format?
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in, name: resource.name)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
end