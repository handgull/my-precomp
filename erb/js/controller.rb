class JsController
  def build_generic(fname)
    print File.read("partials/_"+ fname +".js")
  end
end
