module Query
  # All names.
  class NameAll < Query::NameBase
    def initialize_flavor
      add_sort_order_to_title
      super
    end
  end
end
