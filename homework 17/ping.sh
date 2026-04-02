#!/bin/bash

TARGET="gachimuchi.com"
FAIL_COUNT=0

echo "Всё стабильно"

while true; do
    OUTPUT=$(ping -n 1 -w 1000 "$TARGET" 2>/dev/null)

    if [ $? -eq 0 ]; then
        FAIL_COUNT=0
        MS=$(echo "$OUTPUT" | grep -oP '(time|время)[=<]\K\d+')

        if [ -n "$MS" ] && [ "$MS" -gt 100 ]; then
            echo "пинг больше 100 мс"
        fi
    else
        ((FAIL_COUNT++))
        if [ "$FAIL_COUNT" -ge 3 ]; then
            echo "не удается выполнить пинг в течение 3 последовательных отправок пакетов"
            FAIL_COUNT=0
        fi
    fi
    sleep 1
done
