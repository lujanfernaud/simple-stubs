module PostHelpers
  def first_post_today
    post = double("first_today")
    allow(post).to receive(:title).and_return("first_today")
    allow(post).to receive(:created_at).and_return(Time.now.beginning_of_day)
    post
  end

  def last_post_today
    post = double("last_today")
    allow(post).to receive(:title).and_return("last_today")
    allow(post).to receive(:created_at).and_return(Time.now.end_of_day)
    post
  end

  def yesterdays_post
    post = double("yesterday")
    allow(post).to receive(:title).and_return("yesterday")
    allow(post).to receive(:created_at).and_return(1.day.ago.end_of_day)
    post
  end

  def created_today(posts)
    posts.map { |post| post if created_today?(post) }.compact
  end

  def created_today?(post)
    post.created_at >= Time.now.beginning_of_day &&
      post.created_at <= Time.now.end_of_day
  end
end
