set -euo pipefail

cd ~/seacms_lab 
# 成功登入後從瀏覽器取得session cookie
# 把下面的PHPSESSID替換為實際值
PHPSESSID="7cb9aac5c39d17d80c59999f59ae08b6" 
TARGET="http://localhost:8080/jxpsl5/ebak/phome.php?phome=DoTranExecSql"

# 建一個 harmless 檔案
HARML="/tmp/harmless_$(date +%s).sql"
printf "harmless test file for DoTranExecSql path\nThis file contains NO SQL.\n" > "$HARML"

RESP="/tmp/resp_upload_no_evidence.html"
HTTP_STATUS=$(curl -s -w "%{http_code}" -b "PHPSESSID=${PHPSESSID}" -F "file=@${HARML}" "${TARGET}" -o "$RESP")

echo "---- HTTP STATUS: $HTTP_STATUS ----"
echo "---- Response body (first 60 lines) ----"
head -n 60 "$RESP" || true
echo "---- End of response ----"

rm -f "$HARML" "$RESP"
