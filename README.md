# Upcase: Test Doubles

## Simple Stubs

Implementing a simple stub for the [Test Doubles](https://thoughtbot.com/upcase/test-doubles) course.

### Before

```ruby
# dashboard_spec.rb

describe "#posts" do
  it "returns posts created today" do
    create :post, title: "first_today", created_at: Time.now.beginning_of_day
    create :post, title: "last_today", created_at: Time.now.end_of_day
    create :post, title: "yesterday", created_at: 1.day.ago.end_of_day
    dashboard = Dashboard.new(posts: Post.all)

    result = dashboard.todays_posts

    expect(result.map(&:title)).to match_array(%w(first_today last_today))
  end
end
```

### After

```ruby
# dashboard_spec.rb

describe "#posts" do
  it "returns posts created today" do
    posts_published_today = double("todays_posts")
    allow(Post).to receive(:today).and_return(posts_published_today)

    dashboard = Dashboard.new(posts: Post.all)

    expect(dashboard.todays_posts).to eq(posts_published_today)
  end
end
```
