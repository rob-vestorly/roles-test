class Organization
  include Mongoid::Document

  field :name, :type => String

  def users
    User.where('organization_roles.organization_id' => self.id)
  end
end
