#!/usr/bin/env bash
# 오래된 순으로 LEFT_FILE_COUNT 갯수만 남기고 지움

FILE_DIR='/path/of/remove/file/dir'
LEFT_FILR_COUNT="30"

TOTAL_FILE_COUNT=$(ls $FILE_DIR | wc -l)

echo "DATE: `date "+%y-%m-%d %H:%M:%S"`"
echo "총 파일 갯수 : $TOTAL_FILE_COUNT"

if [ "$TOTAL_FILE_COUNT" -gt "$LEFT_FILR_COUNT" ]; then
	echo "파일 삭제"
	DEL_FILE_COUNT=`expr $TOTAL_FILE_COUNT - $LEFT_FILR_COUNT`
	ls -tr $FILE_DIR | head -$DEL_FILE_COUNT | xargs -n1 rm
else
	echo "파일 삭제 불필요"
fi

