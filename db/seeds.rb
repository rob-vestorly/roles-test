[ 'Mihoshi Academy',
  'New United Nations Military',
  'Strategic Military Services'
].each do |name|
  Organization.create! :name => name
end

[ 'alto.saotome@sms.frontier',
  'michel.blanc@sms.frontier',
  'luca.angelloni@sms.frontier',
  'ranka.lee@mihoshi.frontier',
  'nanase.matsura@mihoshi.frontier'
].each do |email|
  user = User.where(:email => email).exists? ? User.where(:email => email).first : User.create!(:email => email)
  user.organization_roles.create! :organization => Organization.where(:name => 'Mihoshi Academy').first, :role => 'student'
end

[ 'alto.saotome@sms.frontier',
  'michel.blanc@sms.frontier',
  'luca.angelloni@sms.frontier',
  'canaria.bernstein@sms.frontier',
  'raramia.rerenia@sms.frontier'
].each do |email|
  user = User.where(:email => email).exists? ? User.where(:email => email).first : User.create!(:email => email)
  user.organization_roles.create! :organization => Organization.where(:name => 'Strategic Military Services').first, :role => 'pilot'
end

[ 'ozma.lee@sms.frontier',
  'klan.klang@sms.frontier'
].each do |email|
  user = User.where(:email => email).exists? ? User.where(:email => email).first : User.create!(:email => email)
  user.organization_roles.create! :organization => Organization.where(:name => 'Strategic Military Services').first, :role => 'squadron leader'
end

[ 'alto.saotome@sms.frontier',
  'machida@un.frontier',
  'wilen@un.galaxy'
].each do |email|
  user = User.where(:email => email).exists? ? User.where(:email => email).first : User.create!(:email => email)
  user.organization_roles.create! :organization => Organization.where(:name => 'New United Nations Military').first, :role => 'soldier'
end
