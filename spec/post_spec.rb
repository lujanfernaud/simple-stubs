require "spec_helper"
require "post"
require "post_helpers"

describe Post do
  include PostHelpers

  describe "#today" do
    it "returns posts created today" do
      posts = [first_post_today, last_post_today, yesterdays_post]

      allow(Post).to receive(:today).and_return(created_today(posts))

      result = Post.today

      expect(result.map(&:title)).to match_array(%w(first_today last_today))
    end
  end

  around do |example|
    Timecop.freeze { example.run }
  end
end
