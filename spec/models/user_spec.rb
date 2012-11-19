require 'spec_helper'

describe User do
  describe 'validate password before update' do    
    before(:each) do
      @user = FactoryGirl.create( :user )
    end
    it 'user should be valid' do
      @user.valid?.should be_true
    end
    it 'should authenticate user with password as password' do
      @user.authenticate('password').should be_true
    end
    it 'will fail to update' do
      lambda do
        @user.update_attributes!(
          current_password: 'bad_password',
          password: 'sam',
          password_confirmation: 'sam'
        )
      end.should raise_error
      @user.reload.authenticate('password').should be_true
    end
    
    it 'will update the password to sam' do
      @user.authenticate('password').should be_true
      lambda do
        @user.update_attributes!(
          current_password: 'password',
          password: 'sam',
          password_confirmation: 'sam'
        )
      end.should_not raise_error
      @user.reload.authenticate('sam').should be_true  
    end      
  end
end