module Query
  # Names with an rss log.
  class NameByRssLog < Query::NameBase
    def initialize_flavor
      add_join(:rss_logs)
      super
    end

    def default_order
      "rss_log"
    end
  end
end
