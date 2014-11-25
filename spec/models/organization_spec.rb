require 'rails_helper'

RSpec.describe Organization, :type => :model do
  shared_context 'with users' do
    let!(:users) do
      [ 'michel.blanc@sms.frontier',
        'luca.angelloni@sms.frontier',
        'ozma.lee@sms.frontier',
        'klan.klang@sms.frontier'
      ].map do |email|
        User.create(:email => email).tap do |user|
          user.organization_roles.create :organization => instance, :role => 'pilot'
        end
      end
    end
  end

  let(:instance) { described_class.new :name => 'Mihoshi Academy' }

  describe '#users' do
    it { expect(instance).to have_reader(:users).with_value([]) }

    context 'with users' do
      include_context 'with users'

      it { expect(instance.users).to contain_exactly(*users) }
    end
  end
end
