require 'rails_helper'

RSpec.describe User, :type => :model do
  shared_context 'with organizations' do
    let(:instance) { super().tap &:save! }
    let(:organizations) do
      [ 'Mihoshi Academy',
        'Strategic Military Services',
        'New United Nations Military'
      ].map do |name|
        Organization.create :name => name
      end
    end
    let!(:roles) do
      { 'Mihoshi Academy'             => 'student',
        'Strategic Military Services' => 'pilot',
        'New United Nations Military' => 'soldier'
      }.map do |name, role|
        organization = organizations.select { |org| org.name == name }.first
        instance.organization_roles.create :organization => organization, :role => role
      end
    end
  end

  let(:attributes) { { :email => 'saotome.alto@sms.frontier' } }
  let(:instance)   { described_class.new attributes }

  include_examples 'has property', :email, ->() { be == attributes[:email] }

  describe '#organization_roles' do
    it { expect(instance).to have_reader(:organization_roles).with_value([]) }

    context 'with organizations' do
      include_context 'with organizations' do
        it { expect(instance.organization_roles).to contain_exactly *roles }
      end
    end
  end

  describe '#organizations' do
    it { expect(instance).to have_reader(:organizations).with_value([]) }

    context 'with organizations' do
      include_context 'with organizations' do
        it { expect(instance.organizations).to contain_exactly *organizations }
      end
    end
  end
end
