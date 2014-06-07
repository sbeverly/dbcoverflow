require 'spec_helper'

describe Comment do

	context "migrations" do

		let(:comment) { FactoryGirl.build :comment}

		it { comment.should respond_to(:body)}
		it { comment.should respond_to(:user)}
		it { comment.should respond_to(:commentable)}

	end

	context "validations" do
		it { should validate_presence_of :body }
		it { should validate_presence_of :user }
		it { should validate_presence_of :commentable }
		it "body must be present" do
			expect {
				comment = Comment.new
				comment.save
				#expect(comment.errors.full_message) .to include("Body can't be blank")
			}.not_to change { Comment.count }
		end
	end
	
	context "assocations" do

		it { should belong_to(:user) }

		it "belongs to user" do
			expect { FactoryGirl.create(:user).comments }.to_not raise_error
			# expect {
			# 	user = FactoryGirl.build :user
			# 	user.comments << FactoryGirl.build(:comment)
			# 	user.save
			# }.to change { Comment.count }.by(1)
		end	

		it { should belong_to :commentable }
	end


	
end