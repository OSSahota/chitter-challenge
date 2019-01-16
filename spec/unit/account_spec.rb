require './lib/account'

describe Account do
  subject(:account) { Account.create(email: '99user@makers.com', password: 'password', name: 'ninetynine user', username: 'user99') }

  it 'Email and password entered correctly' do
    # auth_account = Account.authenticate(account.email, account.password)
    # expect(auth_account).to eq account
    expect(Account.authenticate(account.email, account.password)).to eq account
  end

  it 'Email not registered' do
    expect(Account.authenticate('not_registred@makers.com', account.password)).to eq nil
  end

  it 'Incorrect password provided registered email' do
    expect(Account.authenticate(account.email, 'wrong_password')).to eq nil
  end
end
