class ManageCollaborations

  def self.call(wiki, user_ids)
    user_ids.delete('') if user_ids.length >= 1
    wiki.collaborations.where.not(user_id: user_ids).destroy_all
    user_ids.each { |user_id| Collaboration.create(user_id: user_id, wiki_id: wiki.id) }
  end

end