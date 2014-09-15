require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect( create(:user) ).to be_valid
  end

  describe 'validations' do
    let(:valid_params) do
      { 
        name: 'Peter Thiel', 
        email: 'pt@foundersfund.com' 
      }
    end

    it 'is valid with valid params' do
      expect(User.new(valid_params)).to be_valid
    end

    it 'requires a name' do
      expect(User.new(valid_params.except(:name))).to_not be_valid
    end

    it 'requires an email' do
      expect(User.new(valid_params.except(:email))).to_not be_valid
    end

    it 'requires a unique email' do
      User.create(valid_params)
      user = User.new(name: 'Same email', email: valid_params[:email])
      expect(user).to_not be_valid
    end
  end
end
