# MessageParser provides helpers for parsing RFC822 headers
class JwzThreading::MessageParser
      
  # Subject comparison are case-insensitive      
  def self.is_reply_or_forward(subject)
    pattern = /^(Re|Fwd)/i  
  
    pattern =~ subject ? true : false
  end

  # Subject comparison are case-insensitive  
  def self.normalize_subject(subject)
    pattern = /((Re|Fwd)(\[[\d+]\])?:(\s)?)*([\w]*)/i  
    pattern =~ subject ? $5 : subject
  end


  # return first found message-ID, otherwise nil
  def self.normalize_message_id(message_id)
    # match all characters between "<" and ">"
    pattern = /<([^<>]+)>/
  
    pattern =~ message_id ? $1 : nil
  end

  # return array containing all found message-IDs
  def self.parse_in_reply_to(in_reply_to)
     # match all characters between "<" and ">"
     pattern = /<([^<>]+)>/

      # returns an array for each matches, for each group
      # flatten nested array to a single array
      result = in_reply_to.scan(pattern).flatten
  end

  # return array of matched message-IDs in references header
  def self.parse_references(references)    
    pattern = /<([^<>]+)>/
    # returns an array for each matches, for each group
    # flatten nested array to a single array
    result = references.scan(pattern).flatten
  end
end # MessageParser