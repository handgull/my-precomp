class Pathr
# when in a page or css file there is @{type}_{variable} the souce path will be
# written here.
  def get_domain
    return "https://domain/"
  end
  def get_source(type, sourcename)
    pagespath = "pages/"
    csspath = "css/"
    jspath = "js/"
    imgpath = "assets/images/"
#
#+-------+
#| PAGES |
#+-------+
#
    if type == "itpage" || type == "enpage"
      path = get_domain + pagespath + type[0..1] + "/"
      if sourcename == "example"
        sourcepath = path + "example"
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
      elsif sourcename == "example"
        sourcepath = path + "example.css"
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
      elsif sourcename == "example"
        sourcepath = path + "example.min.js"
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
