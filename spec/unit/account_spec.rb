require './lib/account'

describe Account do
  let(:email) { account.email }
  let(:password) { double :password }
  let(:name) { account.name }
  let(:username) { account.username }
  subject(:account) { account.create(email: 'firstuser@makers.com',
    password: :password, name: 'first user', username: 'userf') }

end
