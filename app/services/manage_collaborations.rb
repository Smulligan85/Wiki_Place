class ManageCollaborations

  def self.call(wiki, user_ids)
    wiki.collaborations.where.not(id: user_ids).destroy_all
    user_ids.each { |user_id| Collaboration.create(user_id: user_id, wiki_id: wiki.id )}
  end

end
