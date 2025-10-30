#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Junpei Yamamoto <s24C1133la@chibakoudai.jp>

ng () {
        echo ${1}行目が違うヨ
        res=1
}

res=0

out=$(seq 5 | ./plus)
[ "${out}" = 15.0 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK #通ったのが（人間に）分かるように表示
exit $res

