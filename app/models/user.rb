class User
  include Mongoid::Document

  field :email, :type => String

  embeds_many :organization_roles

  def organizations
    organization_ids = organization_roles.map &:organization_id

    Organization.find(organization_ids)
  end
end
