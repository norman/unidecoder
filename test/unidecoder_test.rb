# encoding: utf-8
$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
$:.unshift File.expand_path(File.dirname(__FILE__))
$:.uniq!
require "test/unit"
require "unidecoder"


class UnidecoderTest < Test::Unit::TestCase
  # Silly phrases courtesy of Frank da Cruz (http://www.columbia.edu/kermit/utf8.html).

  DONT_CONVERT = [
    "Vitrum edere possum; mihi non nocet.",               # Latin
    "Je puis mangier del voirre. Ne me nuit.",            # Old French
    "Kristala jan dezaket, ez dit minik ematen.",         # Basque
    "Kaya kong kumain nang bubog at hindi ako masaktan.", # Tagalog
    "Ich kann Glas essen, ohne mir weh zu tun.",          # German
    "I can eat glass and it doesn't hurt me.",            # English
  ]

  CONVERT_PAIRS = {
    # French
    "Je peux manger du verre, ça ne me fait pas de mal."     => "Je peux manger du verre, ca ne me fait pas de mal.",
    # Romanian
    "Pot să mănânc sticlă și ea nu mă rănește."              => "Pot sa mananc sticla si ea nu ma raneste.",
    # Icelandic
    "Ég get etið gler án þess að meiða mig."                 => "Eg get etid gler an thess ad meida mig.",
    # Albanian
    "Unë mund të ha qelq dhe nuk më gjen gjë."               => "Une mund te ha qelq dhe nuk me gjen gje.",
    # Polish
    "Mogę jeść szkło i mi nie szkodzi."                      => "Moge jesc szklo i mi nie szkodzi.",
    # Russian
    "Я могу есть стекло, оно мне не вредит."                 => "Ia moghu iest' stieklo, ono mnie nie vriedit.",
    # Bulgarian
    "Мога да ям стъкло, то не ми вреди."                     => "Mogha da iam stklo, to nie mi vriedi.",
    # Anglo-Saxon
    "ᛁᚳ᛫ᛗᚨᚷ᛫ᚷᛚᚨᛋ᛫ᛖᚩᛏᚪᚾ᛫ᚩᚾᛞ᛫ᚻᛁᛏ᛫ᚾᛖ᛫ᚻᛖᚪᚱᛗᛁᚪᚧ᛫ᛗᛖ᛬"              => "ic.mag.glas.eotacn.ond.hit.ne.heacrmiacth.me:",
    # Classical Greek
    "ὕαλον ϕαγεῖν δύναμαι· τοῦτο οὔ με βλάπτει"              => "ualon phagein dunamai; touto ou me blaptei",
    # Hindi
    "मैं काँच खा सकता हूँ और मुझे उससे कोई चोट नहीं पहुंचती" => "maiN kaaNc khaa sktaa huuN aur mujhe usse koii cott nhiiN phuNctii",
    # Thai
    "ฉันกินกระจกได้ แต่มันไม่ทำให้ฉันเจ็บ"                   => "chankinkracchkaid aetmanaimthamaihchanecchb",
    # Chinese
    "我能吞下玻璃而不伤身体。"                                           => "Wo Neng Tun Xia Bo Li Er Bu Shang Shen Ti . ",
    # Japanese
    "私はガラスを食べられます。それは私を傷つけません。"                              => "Si hagarasuwoShi beraremasu. sorehaSi woShang tukemasen. ",
    "من می توانم بدونِ احساس درد شيشه بخورم" => # Persian
      "mn my twnm bdwni Hss drd shyshh bkhwrm",
    "أنا قادر على أكل الزجاج و هذا لا يؤلمن" => # Arabic
      "'n qdr `l~ 'kl lzjj w hdh l yw'lmn",
    "אני יכול לאכול זכוכית וזה לא מזיק לי" => # Hebrew
      "ny ykvl lkvl zkvkyt vzh l mzyq ly",
  }

  def test_should_raise_error_with_invalid_utf8
    [
      "\x80",  # Continuation byte, low (cp125)
      "\x94",  # Continuation byte, mid (cp125)
      "\x9F",  # Continuation byte, high (cp125)
      "\xC0",  # Overlong encoding, start of 2-byte sequence, but codepoint < 128
      "\xC1",  # Overlong encoding, start of 2-byte sequence, but codepoint < 128
      "\xC2",  # Start of 2-byte sequence, low
      "\xC8",  # Start of 2-byte sequence, mid
      "\xDF",  # Start of 2-byte sequence, high
      "\xE0",  # Start of 3-byte sequence, low
      "\xE8",  # Start of 3-byte sequence, mid
      "\xEF",  # Start of 3-byte sequence, high
      "\xF0",  # Start of 4-byte sequence
      "\xF1",  # Unused byte
      "\xFF",  # Restricted byte
    ].map do |byte|
      assert_raise ArgumentError, "#{byte.inspect} did not raise error" do
        Unidecoder.decode("a#{byte}a")
      end
    end

  end

  def test_unidecoder_decode
    DONT_CONVERT.each do |ascii|
      assert_equal ascii, Unidecoder.decode(ascii)
    end
    CONVERT_PAIRS.each do |unicode, ascii|
      assert_equal ascii, Unidecoder.decode(unicode)
    end
  end

  def test_unidecoder_encode
    {
      # Strings
      "0041" => "A",
      "00e6" => "æ",
      "042f" => "Я"
    }.each do |codepoint, unicode|
      assert_equal unicode, Unidecoder.encode(codepoint)
    end
  end

  def test_unidecoder_in_yaml_file
    {
      "A" => "x00.yml (line 67)",
      "π" => "x03.yml (line 194)",
      "Я" => "x04.yml (line 49)"
    }.each do |character, output|
      assert_equal output, Unidecoder.in_yaml_file(character)
    end
  end

  def test_override
    assert_equal "Juergen", Unidecoder.decode("Jürgen", "ü" => "ue")
  end

end
