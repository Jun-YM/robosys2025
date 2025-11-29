#!/bin/bash
# SPDX-FileCopyrightText: 2025 Junpei Yamamoto <s24C1133la@chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

COMMAND="./tcgcheck"

# エラー判定関数
ng () {
    echo "${1}行目が違うヨ"
    res=1
}

res=0

#正常な入力の場合

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

# 全角数字と半角数字で入力された場合(３1)
out=$(echo ３1| $COMMAND | tr -d '\n')
[ "${out}" = "99.97" ] || ng "$LINENO"

#異常な入力の場合

# 範囲外（プラス方向）
out=$(echo 41 | $COMMAND 2>&1)
[ "${out}" = "負または40より大きい数です" ] || ng "$LINENO"

# 範囲外（マイナス方向）
out=$(echo -1 | $COMMAND 2>&1)
[ "${out}" = "負または40より大きい数です" ] || ng "$LINENO"

# 数字以外が来た場合
out=$(echo あ | $COMMAND 2>&1)
[ "${out}" = "数字を入力してください" ] || ng "$LINENO"

# 空の入力
out=$(echo | $COMMAND)
[ "${out}" = "" ] || ng "$LINENO"

# 結果表示
[ "${res}" = 0 ] && echo OK
exit $res
