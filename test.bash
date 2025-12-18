#!/bin/bash
# SPDX-FileCopyrightText: 2025 Junpei Yamamoto <s24C1133la@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

COMMAND="./tcgcheck"

# エラー判定関数
# 失敗したときにresを1にして、何行目で失敗したかを表示する
ng () {
    echo "${1}行目が違うヨ"
    res=1
}

res=0

#正常な入力のテスト

# 3枚の場合
out=$(echo 3 | $COMMAND)
[ "${out}" = "33.76" ] || ng "$LINENO"

# 0枚の場合
out=$(echo 0 | $COMMAND)
[ "${out}" = "0.00" ] || ng "$LINENO"

# 36枚の場合
out=$(echo 36 | $COMMAND)
[ "${out}" = "100.00" ] || ng "$LINENO"

# 全角数字で入力された場合
out=$(echo ３ | $COMMAND | tr -d '\n')
[ "${out}" = "33.76" ] || ng "$LINENO"


#不正な入力のテスト(終了ステータスのチェック)

# 1. 数値以外の文字列（あ）を入力した場合
echo "あ" | $COMMAND > /dev/null 2>&1
# 終了ステータスが 1 であることを確認（0ならng）
[ "$?" = 1 ] || ng "$LINENO"

# 2. 範囲外の数値（41以上）を入力した場合
echo "41" | $COMMAND > /dev/null 2>&1
[ "$?" = 1 ] || ng "$LINENO"

# 3. 負の数値を入力した場合
echo "-1" | $COMMAND > /dev/null 2>&1
[ "$?" = 1 ] || ng "$LINENO"

# 4. 何も入力しなかった（空行）場合
echo "" | $COMMAND > /dev/null 2>&1
[ "$?" = 1 ] || ng "$LINENO"


exit $res
