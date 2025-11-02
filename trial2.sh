cd ~/seacms_lab
# 成功登入後從瀏覽器取得session cookie
# 把下面的PHPSESSID替換為實際值
PHPSESSID="7cb9aac5c39d17d80c59999f59ae08b6"

touch /tmp/empty.sql

curl -b "PHPSESSID=${PHPSESSID}" -F "file=@/tmp/empty.sql" "http://localhost:8080/jxpsl5/ebak/phome.php?phome=DoTranExecSql" -o /tmp/resp_upload.html -s -w "\nHTTPSTATUS:%{http_code}\n"

cat /tmp/resp_upload.html