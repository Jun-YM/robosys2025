#!/bin/bash
# SPDX-FileCopyrightText: 2025 Junpei Yamamoto <s24C1133la@chibakoudai.jp>

ng () {
        echo ${1}行目が違うヨ
        res=1
}

res=0

### NORMAL INPUT ###
out=$(seq 5 | ./plus)
[ "${out}" = 15.0 ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./plus)           #計算できない値を入力してみる
[ "$?" = 1 ]      || ng "$LINENO" #終了ステータスが1なのを確認
[ "${out}" = "" ] || ng "$LINENO" #この行と上の行は入れ替えるとダメです
					#（↑なぜかは考えてみましょう）
out=$(echo | ./plus)              #なにも入力しない
[ "$?" = 1 ]      || ng "$LINENO" #これも異常終了する
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK #通ったのが（人間に）分かるように表示
exit $res
