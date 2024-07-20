function print-colors() {
  color_names=(
    "Black" "Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "White"
    "Bright Black" "Bright Red" "Bright Green" "Bright Yellow"
    "Bright Blue" "Bright Magenta" "Bright Cyan" "Bright White"
  )

  for i in {0..15}; do
    if [ $i -lt 10 ]; then
      index=" $i"
    else
      index=$i
    fi

    tput setaf $i
    echo "Color $index (${color_names[$(expr $i + 1)]})"
  done

  tput sgr0
}

function print-colormap() {
  for i in {0..255}; do
    print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'};
  done
}
