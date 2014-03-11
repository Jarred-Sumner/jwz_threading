# Container for creation of parent/child relationship of messages 
class JwzThreading::Container
  attr_accessor :parent, :children, :next, :message

  def initialize(message = nil)
    @parent = nil
    @message = message
    @children = []
    @next = nil
  end
  
  def dummy?
    @message.nil?
  end

  def children?
    !@children.empty?
  end
  
  def add_child(child)
    child.parent.remove_child(child) unless child.parent.nil?
  
    @children << child
    child.parent = self
  end

  def remove_child(child)
    @children.delete(child)
    child.parent = nil
  end

  def has_descendant?(container)
    return true if self == container     
    return false if @children.empty?
  
    @children.each do |c|
      c.has_descendant?(container)
    end
    
    false
  end
  
  def to_s
    str = self.dummy? ? "#{self.object_id} (dummy)" : "#{@message}"
    str << "(#{@children.size})" if self.children?  
    str
  end
  
end