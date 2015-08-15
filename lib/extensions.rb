require 'singleton'

LangDescr = Class.new do
  attr_accessor :name, :ext
  attr_writer :genComment

  def prodComment(str)
    @genComment.call(str)
  end
end

$hashComment = Proc.new do |str|
  "# " + str + "\n"
end

$dashComment = Proc.new do |str|
  "-- " + str + "\n"
end

$backComment = Proc.new do |str|
  "// " + str + "\n"
end

$backAstComment = Proc.new do |str|
  "/* " + str + " */"
end

$smlComment = Proc.new do |str|
  "(* " + str + " *)" + "\n"
end

LangExtensions = Class.new do
  include Singleton

  def initialize()
    rubyLang = LangDescr.new.tap do |r|
      r.name = "ruby"
      r.ext = [".rb"]
      r.genComment = $hashComment
    end

    haskellLang = LangDescr.new.tap do |h|
      h.name = "Haskell"
      h.ext = [".hs", ".lhs"]
      h.genComment = $dashComment
    end

    cLang = LangDescr.new.tap do |c|
      c.name = "c"
      c.ext = [".c"]
      c.genComment = $backComment
    end

    cppLang = LangDescr.new.tap do |cpp|
      cpp.name = "c"
      cpp.ext = [".cc", ".cpp", ".cxx", ".C"]
      cpp.genComment = $backComment
    end

    prologLang = LangDescr.new.tap do |pl|
      pl.name = "prolog"
      pl.ext = [".pl"]
      pl.genComment = $backAstComment
    end

    smlLang = LangDescr.new.tap do |sml|
      sml.name = "Standard sml"
      sml.ext = [".sml"]
      sml.genComment = $smlComment
    end

    javaLang = LangDescr.new.tap do |j|
      j.name = "java"
      j.ext  = [".java"]
      j.genComment = $backComment
    end

    eweLang = LangDescr.new.tap do |e|
      e.name = "ewe"
      e.ext  = [".ewe"]
      e.genComment = $hashComment
    end

    bashLang = LangDescr.new.tap do |b|
      b.name = "bash"
      b.ext  = [".bs"]
      b.genComment = $hashComment
    end

    # puts "Lenguaje: #{rubyLang.ext[0]} objeto: #{rubyLang}"

    @filexts = { rubyLang.ext[0]    => rubyLang,
                 haskellLang.ext[0] => haskellLang,
                 haskellLang.ext[1] => haskellLang,
                 cLang.ext[0]       => cLang,
                 cppLang.ext[0]     => cppLang,
                 cppLang.ext[1]     => cppLang,
                 cppLang.ext[2]     => cppLang,
                 cppLang.ext[3]     => cppLang,
                 prologLang.ext[0]  => prologLang,
                 smlLang.ext[0]     => smlLang,
                 bashLang.ext[0]    => bashLang,
                 eweLang.ext[0]     => eweLang,
                 javaLang.ext[0]    => javaLang
             }
  end
  def getLangDesc(ext)
    @filexts[ext]
  end
end

# Testing
# le = LangExtensions.instance
# lang = le.getLangDesc('.hs')
# comm = lang.prodComment('Hola mundo')
#
# puts "extensions"
