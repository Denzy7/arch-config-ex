history \
    | sed 's/^[ ]*[0-9]\+[ ]*//' \
    | sed -E 's/^(sudo|doas)[[:space:]]+//' \
    | awk '{print $1}' \
    | sort \
    | uniq -c \
    | sort -nr \
    | head -n 200

