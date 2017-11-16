class Pathr
  def get_domain
    return "https://sitet.herokuapp.com/"
    #return "http://localhost/"
  end
  def get_source(type, sourcename)
    pagespath = "pages/"
    csspath = "css/"
    jspath = "js/"
    imgpath = "assets/images/"
#
#+--------+
#| PAGES |
#+--------+
#
    if type == "itpage" || type == "enpage"
      path = get_domain + pagespath + type[0..1] + "/"
      if sourcename == "home"
        sourcepath = path + "home"
      end
#
#+-----+
#| CSS |
#+-----+
#
    elsif type == "css"
      path = get_domain + csspath
      if sourcename == "fa"
        sourcepath = path + "font-awesome.min.css"
      elsif sourcename == "base"
        sourcepath = path + "base.css"
      elsif sourcename == "home"
        sourcepath = path + "home.css"
      end
#
#+----+
#| JS |
#+----+
#
    elsif type == "js"
      path = get_domain + jspath
      if sourcename == "jquery"
        sourcepath = path + "jquery-3.2.1.min.js"
      elsif sourcename == "slides"
        sourcepath = path + "responsiveslides.min.js"
      elsif sourcename == "home"
        sourcepath = path + "home.min.js"
      end
#
#+--------+
#| IMAGES |
#+--------+
#
    elsif type == "img"
      path = get_domain + imgpath
      if sourcename == "favicon"
        sourcepath = get_domain + "favicon.ico"
      elsif sourcename == "logo"
        sourcepath = path + "logo.png"
      elsif sourcename == "it" || sourcename == "IT"
        sourcepath = path + "flags/it.svg"
      elsif sourcename == "en" || sourcename == "EN"
        sourcepath = path + "flags/en.svg"
      elsif sourcename == "s1"
        sourcepath = path + "slideshow/s1.jpg"
      elsif sourcename == "s2"
        sourcepath = path + "slideshow/s2.jpg"
      elsif sourcename == "s3"
        sourcepath = path + "slideshow/s3.jpg"
      elsif sourcename == "m1"
        sourcepath = path + "mood/m1.png"
      elsif sourcename == "m2"
        sourcepath = path + "mood/m2.png"
      elsif sourcename == "m3"
        sourcepath = path + "mood/m3.png"
      elsif sourcename == "m4"
        sourcepath = path + "mood/m4.png"
      end
    end
    return sourcepath
  end
  def linker(file)
    file = file.gsub("@index", get_domain)
    regex = Regexp.new(/@(?<type>[a-zA-Z]+)_(?<source>[a-zA-Z0-9]+)/)
    match_array = file.scan(regex)
    match_array.each {
      |source|
      type = source.at(0).to_s
      sourcen = source.at(1).to_s
      file = file.gsub("@#{type}_#{sourcen}", get_source(type, sourcen).to_s)
    }
    return file
  end
end
