class TopicCell < Cell::Rails
  def show(topic, omit:false)
    @topic = topic
    @omit = omit && topic_omittable?(topic)

    render
  end

  def omitted(topic)
    @topic = topic

    return if !topic_omittable?(topic)

    limit = @topic.posts.size - 1 - @topic.board.reply_omit_condition.n_recent_only
    @posts = @topic.posts.includes(:images).offset(1).limit(limit)

    render
  end

private

  def topic_omittable?(topic)
    Omit.omit?(
      topic.posts.size - 1,
      topic.board.reply_omit_condition.n_recent_only,
      topic.board.reply_omit_condition.avoid_only_n_hidden
    )
  end
end
