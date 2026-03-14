#!/usr/bin/env bash

USERNAME=$(echo "$1" | tr -d "[:space:]");
COOKIES_FILE=$(echo "$2" | tr -d "[:space:]");

if [[ -z "$USERNAME" || -z "$COOKIES_FILE" || ! -f "$COOKIES_FILE" ]]; then
    echo "Usage: $0 <username> <cookies_file>"; 
    exit 1; 
fi

CSRF_TOKEN=$(cat "$2" | grep JSESSIONID | cut -d$'\t' -f 7 | tr -d '"' | tr -d "[:space:]")

if [ -z "$CSRF_TOKEN" ]; then
    echo "Error: CSRF_TOKEN (JSESSIONID) not found in $COOKIES_FILE";
    exit 1;
fi

echo "USERNAME: $USERNAME" >&2;
echo "CSRF_TOKEN: $CSRF_TOKEN" >&2;

startfrom=0
step=20
total=1

rm -f certifications.tmp 2>/dev/null 
while [ $startfrom -lt $total ]; do
  URL="https://www.linkedin.com/voyager/api/identity/profiles/$USERNAME/certifications?start=$startfrom&count=$step"
  echo $URL;
  curl -s $URL \
    -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36" \
    -H "csrf-token: $CSRF_TOKEN" \
    -H "x-restli-protocol-version: 2.0.0" \
    -H "accept: application/vnd.linkedin.normalized+json+2.1" \
    -b "$2" \
    --compressed | jq . > response.tmp

  total=$(jq -r '.data.paging.total // 0' response.tmp)
  [[ ! "$total" =~ ^[0-9]+$ ]] && { echo "Response error" >&2; break; }

  jq -c '.included[]? | select(.["$type"]? != null and (.["$type"] | contains("Certification")))' response.tmp >> certifications.tmp

  startfrom=$((startfrom + step))
done 

jq -s '.' certifications.tmp > certifications.json

rm -f response.tmp 2>/dev/null
rm -f certifications.tmp 2>/dev/null
echo
