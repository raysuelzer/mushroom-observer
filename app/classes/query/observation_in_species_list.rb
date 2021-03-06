module Query
  # Observations in a given species_list.
  class ObservationInSpeciesList < Query::ObservationBase
    def parameter_declarations
      super.merge(
        species_list: SpeciesList
      )
    end

    def initialize_flavor
      spl = find_cached_parameter_instance(SpeciesList, :species_list)
      title_args[:species_list] = spl.format_name
      add_join(:observations_species_lists)
      where << "observations_species_lists.species_list_id = '#{spl.id}'"
      super
    end

    def default_order
      "name"
    end

    def coerce_into_image_query
      do_coerce(:Image)
    end

    def coerce_into_location_query
      do_coerce(:Location)
    end

    def coerce_into_name_query
      do_coerce(:Name)
    end

    def do_coerce(new_model)
      Query.lookup(new_model, :with_observations_in_species_list,
                   params_plus_old_by)
    end
  end
end
