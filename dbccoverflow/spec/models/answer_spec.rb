require 'spec_helper'

describe Answer do
  user = FactoryGirl.build :user
  question = FactoryGirl.build :question
  answer = FactoryGirl.build :answer
  answer.question = question
  answer.user = user
  answer.save

  let (:answer) { answer }

context "instances" do
  it { answer.should be_an_instance_of(Answer)}
  it { answer.user.should be_an_instance_of(User)}
  it { answer.question.should be_an_instance_of(Question)}
  it { answer.body.should be_an_instance_of(String)}
end

context "associations" do
  it { answer.should respond_to(:body) } 
  it { answer.should respond_to(:question) }
  it { answer.should respond_to(:user) }
  it { answer.should have_many :votes}
  it { answer.should have_many :comments}
end
	
end