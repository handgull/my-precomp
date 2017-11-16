# ATTENZIONE ALLA EVAL, SE SI MODIFICA LA VARIABILE text IN write
class Langw
  def basetitle
    return "MYTITLE"
  end
  def write(filec, get_text)
    # in error pages i don't need different titles in it or en
    filec = filec.gsub("=e404_title", basetitle + " | 404")
    filec = filec.gsub("=e500_title", basetitle + " | 500")
    regex = Regexp.new(/=(?<text>[a-zA-Z0-9]+_?[a-zA-Z]+)/)
    match_array = filec.scan(regex)
    match_array.each {
      |text|
      text = text.at(0)
      filec = filec.gsub("=" + text, eval(get_text).to_s)
    }
    return filec
  end
  def writer(file, lang)
    file = File.read(file)
    file = file.gsub("@lang", lang)
    if lang == "it" || lang == "IT"
      return write(file, "ITtext.new.get_text(text)")
    else
      return write(file, "ENtext.new.get_text(text)")
    end
  end
end

class ITtext
  def get_text(text)
# when in a page there is ={page}_{variable} will be translated here
#
#+--------------+
#| EXAMPLE HOME |
#+--------------+
#
    if text == "home_title"
      return Langw.new.basetitle
    elsif text == "services"
      return "I nostri servizi"
    elsif text == "slideshow"
      return "Presentazione"
    elsif text == "what"
      return "Cosa facciamo"
    elsif text == "mood"
      return "Mood"
    elsif text == "who"
      return "Chi siamo"
    elsif text == "w1_text"
      return "Lorem ipsum dolor sit amet,
              <b>consectetuer</b> adipiscing elit.
              Aenean commodo ligula eget dolor. Aenean massa.
              Cum sociis natoque penatibus <b>et magnis dis</b> parturient montes,
              nascetur ridiculus mus."
    elsif text == "w2_text"
      return "Lorem ipsum dolor sit amet,
              <b>consectetuer</b> adipiscing elit.
              Aenean commodo ligula eget dolor. Aenean massa.
              Cum sociis natoque penatibus <b>et magnis dis</b> parturient montes,
              nascetur ridiculus mus."
    elsif text == "w3_text"
      return "Lorem ipsum dolor sit amet,
              <b>consectetuer</b> adipiscing elit.
              Aenean commodo ligula eget dolor. Aenean massa.
              Cum sociis natoque penatibus <b>et magnis dis</b> parturient montes,
              nascetur ridiculus mus."
    end
  end
end

class ENtext
  def get_text(text)
# when in a page there is ={page}_{variable} will be translated here
#
#+--------------+
#| EXAMPLE HOME |
#+--------------+
#
    if text == "home_title"
      return Langw.new.basetitle
    elsif text == "services"
      return "Our services"
    elsif text == "slideshow"
      return "Slideshow"
    elsif text == "what"
      return "What we do"
    elsif text == "mood"
      return "Mood"
    elsif text == "who"
      return "Who we are"
    elsif text == "w1_text"
      return "Lorem ipsum dolor sit amet,
              <b>consectetuer</b> adipiscing elit.
              Aenean commodo ligula eget dolor. Aenean massa.
              Cum sociis natoque penatibus <b>et magnis dis</b> parturient montes,
              nascetur ridiculus mus."
    elsif text == "w2_text"
      return "Lorem ipsum dolor sit amet,
              <b>consectetuer</b> adipiscing elit.
              Aenean commodo ligula eget dolor. Aenean massa.
              Cum sociis natoque penatibus <b>et magnis dis</b> parturient montes,
              nascetur ridiculus mus."
    elsif text == "w3_text"
      return "Lorem ipsum dolor sit amet,
              <b>consectetuer</b> adipiscing elit.
              Aenean commodo ligula eget dolor. Aenean massa.
              Cum sociis natoque penatibus <b>et magnis dis</b> parturient montes,
              nascetur ridiculus mus."
    end
  end
end
