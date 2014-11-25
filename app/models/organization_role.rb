class OrganizationRole
  include Mongoid::Document

  field :role, :type => String

  belongs_to :organization

  embedded_in :user
end
