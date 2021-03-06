xml.tag!(tag,
  :id => object.id,
  :url => object.show_url,
  :type => 'naming'
) do
  xml_detailed_object(xml, :name, object.name)
  xml_confidence_level(xml, :confidence, object.vote_cache)
  reasons = object.get_reasons.select(&:used?)
  if reasons.any?
    xml.reasons(:number => reasons.length) do
      for reason in reasons
        xml_naming_reason(xml, :reason, reason)
      end
    end
  end
  if detail
    xml_datetime(xml, :created_at, object.created_at)
    xml_datetime(xml, :updated_at, object.updated_at)
    xml_minimal_object(xml, :owner, User, object.user_id)
    xml_minimal_object(xml, :observation, Observation, object.observation_id)
    xml.votes(:number => object.votes.length) do
      for vote in object.votes
        xml_detailed_object(xml, :vote, vote)
      end
    end
  end
end
