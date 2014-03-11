# Lightweight Message for the minimal used message attributes
# 
# Use message-ID as a reference to the original TMail::Mail object.
#
# TODO: re-think class design: what is the best way for consumers of
#       this API to use Message class different TMail::Mail
#       Can't use TMail::Mail directly since it is an in-memory algorithm
#       and the complete message would allocate too much heap space 

class JwzThreading::Message
  attr_reader :subject, :message_id, :references
  attr_accessor :from

  def initialize(subject, message_id, references)
    @subject = subject;
    @message_id = message_id
    @references = references
    # do we need "From" in the first place here?
    # - not for this algorithm to function!
    @from = ""
  end
  
  def to_s
    "#{@from}:#{@subject}"
  end
end