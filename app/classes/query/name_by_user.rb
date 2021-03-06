module Query
  # Names created by a given user.
  class NameByUser < Query::NameBase
    def parameter_declarations
      super.merge(
        user: User
      )
    end

    def initialize_flavor
      user = find_cached_parameter_instance(User, :user)
      title_args[:user] = user.legal_name
      where << "names.user_id = '#{user.id}'"
      super
    end
  end
end
