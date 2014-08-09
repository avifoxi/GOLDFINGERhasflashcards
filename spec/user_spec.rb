require 'spec_helper'

# describe User do
#   pending "add some examples to (or delete) /Users/AviFoxi/Desktop/GOLDFINGERhasflashcards/Rakefile"
# end

# puts 'creates new User:'
# oldcount = User.all.count
# User.create(name: 'dummy', email: "dummy@dummy.dummy", password: "dummy")
# p User.all.count == (oldcount + 1)


RSpec.describe User do
  describe "User" do
    it "adds user to DB on create" do
      oldcount = User.all.count
			User.create(name: 'dummy', email: "dummy@dummy.dummy", password: "dummy")
      expect(User.all.count).to eq(oldcount + 1)
    end

    ## to add upon other branch additions:
    ## add bcrypt install test 


    it "deletes user from DB at end of test" do
      dummycount = User.all.count
			User.last.delete
      expect(User.all.count).to eq(dummycount - 1)
    end

  end

end
