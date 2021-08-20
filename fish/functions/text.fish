function text --description 'Transform the input into some silly unicode output'
  set --local alpha a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  set --local bubbs ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ
  set --local nubbs 🅐 🅑 🅒 🅓 🅔 🅕 🅖 🅗 🅘 🅙 🅚 🅛 🅜 🅝 🅞 🅟 🅠 🅡 🅢 🅣 🅤 🅥 🅦 🅧 🅨 🅩 🅐 🅑 🅒 🅓 🅔 🅕 🅖 🅗 🅘 🅙 🅚 🅛 🅜 🅝 🅞 🅟 🅠 🅡 🅢 🅣 🅤 🅥 🅦 🅧 🅨 🅩
  set --local fulls ａ ｂ ｃ ｄ ｅ ｆ ｇ ｈ ｉ ｊ ｋ ｌ ｍ ｎ ｏ ｐ ｑ ｒ ｓ ｔ ｕ ｖ ｗ ｘ ｙ ｚ Ａ Ｂ Ｃ Ｄ Ｅ Ｆ Ｇ Ｈ Ｉ Ｊ Ｋ Ｌ Ｍ Ｎ Ｏ Ｐ Ｑ Ｒ Ｓ Ｔ Ｕ Ｖ Ｗ Ｘ Ｙ Ｚ
  set --local squrs 🄰 🄱 🄲 🄳 🄴 🄵 🄶 🄷 🄸 🄹 🄺 🄻 🄼 🄽 🄾 🄿 🅀 🅁 🅂 🅃 🅄 🅅 🅆 🅇 🅈 🅉 🄰 🄱 🄲 🄳 🄴 🄵 🄶 🄷 🄸 🄹 🄺 🄻 🄼 🄽 🄾 🄿 🅀 🅁 🅂 🅃 🅄 🅅 🅆 🅇 🅈 🅉
  set --local nqurs 🅰 🅱 🅲 🅳 🅴 🅵 🅶 🅷 🅸 🅹 🅺 🅻 🅼 🅽 🅾 🅿 🆀 🆁 🆂 🆃 🆄 🆅 🆆 🆇 🆈 🆉 🅰 🅱 🅲 🅳 🅴 🅵 🅶 🅷 🅸 🅹 🅺 🅻 🅼 🅽 🅾 🅿 🆀 🆁 🆂 🆃 🆄 🆅 🆆 🆇 🆈 🆉
  set --local flips ɐ q ɔ p ǝ ɟ ƃ ɥ ı ɾ ʞ ן ɯ u o d b ɹ s ʇ n ʌ ʍ x ʎ z ɐ q ɔ p ǝ ɟ ƃ ɥ ı ɾ ʞ ן ɯ u o d b ɹ s ʇ n 𐌡 ʍ x ʎ z
  set --local scaps ᴀ ʙ ᴄ ᴅ ᴇ ꜰ ɢ ʜ ɪ ᴊ ᴋ ʟ ᴍ ɴ ᴏ ᴩ q ʀ ꜱ ᴛ ᴜ ᴠ ᴡ x y ᴢ ᴀ ʙ ᴄ ᴅ ᴇ ꜰ ɢ ʜ ɪ ᴊ ᴋ ʟ ᴍ ɴ ᴏ ᴩ Q ʀ ꜱ ᴛ ᴜ ᴠ ᴡ x Y ᴢ

  argparse --name=bubs 't/type=' 'h/help' -- $argv

  if [ $_flag_help ]
    echo " ████████╗███████╗██╗  ██╗████████╗"
    echo " ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝"
    echo "    ██║   █████╗   ╚███╔╝    ██║   "
    echo "    ██║   ██╔══╝   ██╔██╗    ██║   "
    echo "    ██║   ███████╗██╔╝ ██╗   ██║   "
    echo "    ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝   "

    echo "Usage: `text [-t/--type=] text to manipulate`"
    echo ""
    echo "Examples:"
    echo "> text bubs"
    echo (text bubs)
    echo "> text -t fl flip it"
    echo (text -t fl flip it)
    echo "> text --type=\"negative squares\" squared"
    echo (text --type="negative squares" squared)
    echo ""
    echo "Available types:"
    echo "Bubbles (Default): ⓑⓤⓑⓑⓛⓔⓢ"
    echo "Negative bubbles (nb): 🅝🅔🅖🅐🅣🅘🅥🅔 🅑🅤🅑🅑🅛🅔🅢"
    echo "Full width (fw): Ｆｕｌｌ ｗｉｄｔｈ"
    echo "Squares (sq): 🅂🅀🅄🄰🅁🄴🅂"
    echo "Negative squares (ns): 🅽🅴🅶🅰🆃🅸🆅🅴 🆂🆀🆄🅰🆁🅴🆂"
    echo "Flipped (fl): pǝddıןɟ"
    echo "Small caps (sc/caps): ꜱᴍᴀʟʟ ᴄᴀᴩꜱ"
    return
  end

  set input (string split "" "$argv")

  switch $_flag_type
    case "nb" "negative bubbles"
      set translation $nubbs
    case "fw" "full width"
      set translation $fulls
    case "sq" "squares"
      set translation $squrs
    case "ns" "negative squares"
      set translation $nqurs
    case "fl" "flip"
      set flip true
      set translation $flips
    case "sc" "small caps" "caps"
      set translation $scaps
    case '*'
      set translation $bubbs
  end

  set out ""

  for i in (seq 1 (count $input))
    set --local char $input[$i]
    set --local index (contains -i $char $alpha)

    if [ -n "$index" ]
      set --local replacement $translation[$index]

      set out "$out$replacement"
    else
      set out "$out$char"
    end
  end

  if [ $flip ]
    set out (echo "$out" | rev)
  end

  echo $out
end
