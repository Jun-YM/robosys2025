# robosys2025
ロボットシステム学課題

# tcgcheckコマンド
![test](https://github.com/Jun-YM/robosys2025/actions/workflows/test.yml/badge.svg)

40枚のカードの束から5枚を引いたとき、40枚中N枚入っている特定のカードを1枚以上引ける確率を提示します

0から40までの任意の数字Nを入力すると確率を返します。

## 準備
- このリポジトリをターミナルで下記のようにクローンしてください。
``` 
git clone https://github.com/Jun-YM/robosys2025.git
```

- 下記のディレクトリに移動して、権限を付与してください。
```
cd robosys2025
```
```
chmod +x tcgcheck
```

## 使い方
- 実行方法の例

```
echo 3 | ./tcgcheck
```

- 実行結果の例

```
33.76%
```

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.7〜3.10

## テスト環境
- Ubuntu 22.04.5 LTS

このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．

© 2025 Yamamoto Junpei
