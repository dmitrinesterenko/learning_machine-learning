## Monkey patch that adds a method for adding documentation as a first degree
# citizen

## TODO monkey patch this correctly by having a module around this and
# adding the module into the class
class Class

  ## this is going to add docs from *all* classes to this
  ## class variable. This is potentially dangerous or maybe it's cool
  ## this could be later used to tell if a method needs to exist
  ## or if a similar method exists already
  @@doc= []
  def doc(doc="")
     # I miss Elixir where these would be two methods with different patterns
     if doc === ""
      @@doc
     else
      # desired implementation is { "method" : "documentation" }
      @@doc << caller[0] + doc
     end
  end
end
