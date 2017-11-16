require '../shared/path'
class ScssController
#COOL Example of ruby function for repetitions in files

#  def build_font(font_name)
#    return File.read("partials/_font.css").gsub("@font_name", font_name)
#  end
#  def build_base
#    fonts = build_font("Roboto-Bold") + "\n" +
#            build_font("Roboto-Light") + "\n" +
#            build_font("Roboto-Regular") + "\n"
#    base = File.read("partials/_base.scss")
#    print (fonts + base)
#  end
  def build_generic(fname)
    file = File.read(File.expand_path("partials/_"+ fname +".scss"))
    print Pathr.new.linker(file)
  end
end
