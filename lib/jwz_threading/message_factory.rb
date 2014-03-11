# Factory for creating messages. Ensures consistent data required
# for threading algorithm.
class JwzThreading::MessageFactory

  def self.create(subject, message_id, in_reply_to, references)    
    references ||= []
    in_reply_to ||= []
    subject ||= ""
    
    # if there are no message-IDs in references header  
    # use the first found message-ID of the in-reply-to header instead
    references << in_reply_to.first if references.empty? && !in_reply_to.empty?

    message_id ||= ::TMail::new_msgid()
    
    Message.new(subject, message_id, references)
  end
end