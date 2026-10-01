OSU_WINELLO_DIH="$HOME/.osu/drive_c/osu"

Help() {
  echo "osu-import <directory> [output directory]"
  echo "osu-import will take care of putting the osu files from <directory> into the output directory"
  echo "If the output directory is not specified, nixosu-import will put the files into \$HOME/.local/share/osu-wine/osu!, the default directory which osu-wine is installed in."
}

ExtractOsuFile() {
  FULL_FILE_NAME="$1"

  FILE_NAME=$(basename -- "$FULL_FILE_NAME")
  FILE_EXTENSION="${FILE_NAME##*.}"
  FILE_NAME_NOEXTENSION="${FILE_NAME%.*}"

  echo "[LOG] Extracting...: $FILE_NAME"

  OUTPUT_FILE_DIH="$OSU_WINELLO_DIH"

  if [ "$FILE_EXTENSION" = "osz" ]; then
    OUTPUT_FILE_DIH="$OUTPUT_FILE_DIH/Songs"
  elif [ "$FILE_EXTENSION" = "osk" ]; then
    OUTPUT_FILE_DIH="$OUTPUT_FILE_DIH/Skins"
  else
    echo "[ERROR] File extension not supported (yet) :( -> Aborting extraction of $FILE_NAME"
    return
  fi

  OUTPUT_FILE_DIH="$OUTPUT_FILE_DIH/$FILE_NAME_NOEXTENSION"

  if [ -d "$OUTPUT_FILE_DIH" ]; then
    return
  fi

  mkdir -p "$OUTPUT_FILE_DIH"

  unzip -oq "$FULL_FILE_NAME" -d "$OUTPUT_FILE_DIH"
}



if [ "$#" -lt "1" ]; then
  Help
  exit
fi

OSU_RAW_DIH="$1"

if [ "$#" -gt "1" ]; then 
  OSU_WINELLO_DIH="$2"
fi

echo "[LOG] Osu raw files will be installed at $OSU_WINELLO_DIH"

echo "[LOG] Creating songs and skins directory in the output directory...(will not overwrite existing directory)"

mkdir -p "$OSU_WINELLO_DIH/Songs"
mkdir -p "$OSU_WINELLO_DIH/Skins"

if [ ! -d "$OSU_RAW_DIH" ]; then
  echo "Erm the directory does not exist ?"
  Help
  exit
fi

fd . "$OSU_RAW_DIH" --type f -e osz -e osk | while read -r file; do ExtractOsuFile "$file"; done
echo "[LOG] Extraction is complete! Go into the game and F5 to refresh song list! (screw the warnings)"
