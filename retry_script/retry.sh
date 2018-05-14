#!/usr/bin/env bash
# 스크립트틑 3번 제 시도 함 실패시 3분(정확하지는 않음) 쉬었다 실행

# 스크립트 실행
./somescript.sh

# 실패시 3 번 더 시도
RESULT="$?"
COUNT=0

while true; do
    COUNT=$(( COUNT+1 ))

    # 3번 시도 했을 경우
    if [ "$COUNT"  -gt "3" ]; then
        echo "3 time attempt then fail"
        exit 1
    fi

    # 리턴 에러 코드에 따라 분기 처리
    # 0 : 스크립트 성공
    # 1 : 스크립트 실패

    # 성공
    if [ "$RESULT" == "0" ]; then

        echo "script run success"
        break;

    # 팀 통계 집계 실패
    elif [ "$RESULT" == "1" ]; then

        echo "script run fail"

        # 3분 쉬기
        sleep 180

        ./somescript.sh

    fi

    RESULT="$?"
done




