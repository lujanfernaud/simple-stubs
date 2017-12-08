require "spec_helper"
require "dashboard"
require "post_helpers"

describe Dashboard do
  include PostHelpers

  describe "#posts" do
    it "returns posts created today" do
      posts = [first_post_today, last_post_today, yesterdays_post]

      allow(Post).to receive(:today).and_return(created_today(posts))

      dashboard = Dashboard.new(posts: Post.all)
      result = dashboard.todays_posts

      expect(result.map(&:title)).to match_array(%w(first_today last_today))
    end
  end

  around do |example|
    Timecop.freeze { example.run }
  end
end
