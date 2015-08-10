require 'singleton'

class LangDescr
  attr_accessor :name, :ext
  attr_writer :genComment

  def prodComment(str)
    genCommment str
  end
end

def hashComment(str)
  return "# " + str + "\n"
end

def dashComment(str)
  return "-- " + str + "\n"
end

def backComment(str)
  return "// " + str + "\n"
end

def backaAstComment(str)
  return "/* " + str + " */"
end

def smlComment(str)
  return "(* " + str + " *)" + "\n"
end


class LangExtensions
  include Singleton
  def initialize()
    rubyLang = LangDescr.new do |r|
      r.name = "ruby"
      r.ext = [".rb"]
      r.genComment = hashComment
    end

    haskellLang = LangDescr.new do |h|
      h.name = "Haskell"
      h.ext = [".hs", ".lhs"]
      h.genComment = dashComment
    end

    cLang = LangDescr.new do |c|
      c.name = "c"
      c.ext = [".c"]
      c.genComment = backComment
    end

    cppLang = LangDescr.new do |cpp|
      cpp.name = "c++"
      cpp.ext = [".cc", ".cpp", ".cxx"]
      cpp.genComment = backComment
    end

    prologLang = LangDescr.new do |pl|
      pl.name = "prolog"
      pl.ext = [".pl"]
      pl.genComment = backAstComment
    end

    smlLang = LangDescr.new do |sml|
      sml.name = "Standard sml"
      sml.ext = [".sml"]
      sml.genComment = smlComment
    end

    javaLang = LangDescr.new do |j|
      j.name = "Java"
      j.ext  = [".java"]
      j.genComment = backComment
    end

    eweLang = LangDescr.new do |e|
      e.name = "ewe"
      e.ext  = [".ewe"]
      e.genComment = hashComment
    end

    bashLang = LangDescr.new do |b|
      b.name = "bash"
      b.ext  = [".ewe"]
      b.genComment = hashComment
    end

    @filexts = { (rubyLang.ext.[] 0)    => rubyLang
               }
    #              haskellLang.ext[0] => haskellLang,
    #              haskellLang.ext[1] => haskellLang,
    #              cLang.ext[0]       => cLang,
    #              cppLang.ext[0]     => cppLang,
    #              cppLang.ext[1]     => cppLang,
    #              prologLang.ext[0]  => prologLang,
    #              smlLang.ext[0]     => smlLang,
    #              bashLang.ext[0]    => bashLang,
    #              eweLang.ext[0]     => eweLang,
    #              javaLang.ext[0]    => javaLang
    #          }
  end
  def getLangDesc(ext)
    @filexts[ext]
  end
end
