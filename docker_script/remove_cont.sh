#!/bin/bash
# 인자로 컨테이너 명으로 검색을 해 겁색된 컨테이너는 삭제함
CONT_NAME=$1

if [ "$1" = "" ]; then
	echo "컨테이너명을 입력해주세요"
	exit 1
fi

# check docker container exist if exist will be remove
REAL_CONT=$(docker ps -a --format "{{.Names}}" | grep $CONT_NAME 2> /dev/null)
if [[ "$REAL_CONT" != "" ]]; then
	echo "Docker 컨테이너를 삭제합니다."
	docker rm -f $REAL_CONT
	echo "삭제 됨"
fi
