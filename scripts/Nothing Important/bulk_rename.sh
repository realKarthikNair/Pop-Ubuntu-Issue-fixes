# actually i use this to purge all disabled ppas
find -type f -name '*.save' -print0 | while read -d $'\0' f; do mv "$f" "${f%.save}"; done
