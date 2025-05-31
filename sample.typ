#import "./lib.typ": *

#show: use-sugawa-style

#title(
    "TestTitle",
    date: "202X-01-01",
    yourname: "Your Name",
    yournumber: "1234567890",
    titlesize: 2.0em,
    yournamesize: 1.0em,
)

= 見出し

=

インラインコードは `こんな` 感じで書きます。

コードブロックです。

```rust
fn main() {
    let max_number = 1000;
    let mut prime_numbers = Vec::new();
    let mut numbers: Vec<_> = (2..=max_number).collect();

    while let Some(&n) = numbers.first() {
        if n * n > max_number {
            break;
        }
        prime_numbers.push(n);numbers = numbers.iter().filter(|&x| x % n != 0).cloned().collect();
    }
    prime_numbers.append(&mut numbers);
    println!("{:?}", prime_numbers);
}

``` <r1>

コードの参照もできます. @p1 を参照してください.

#codeblock(
    caption: "コードブロック例",
    ref: <p1>,
    ```cpp
    #include <bits/stdc++.h>
    using namespace std;

    int main() {
        long long N, L, K;
        cin >> N >> L >> K;
        vector<long long> A(N);
        for (int i = 0; i < N; ++i) cin >> A[i];

        auto check = [&](long long x) -> bool {
            long long num = 0;
            long long pre = 0;
            for (int i = 0; i < N; ++i) {
                if (A[i] - pre >= x) {
                    ++num;
                    pre = A[i];
                }
            }
            if (L - pre >= x) ++num;

            return (num >= K + 1);
        };

        long long left = -1, right = L + 1;
        while (right - left > 1) {
            long long mid = (left + right) / 2;
            if (check(mid)) left = mid;
            else right = mid;
        }
        cout << left << endl;
    }
    ```,
)

#sourcefile(
    caption: "ソースファイル例",
    ref: <p2>,
    lang: "cpp",
    file: "sample.cc",
)

#sourcefile(
    caption: "ソースファイル例2",
    ref: <p3>,
    lang: "cpp",
    file: read("sample.cc"),
)


コードのサイズ変更

```python
print("Hello, World!")
```

#show raw: set text(size: 7pt)

```python
print("Hello, World!")
```

#show raw: set text(size: 8pt)

```python
print("Hello, World!")
```

#itembox(
    title: "Rust コード",
    ```rust
    fn main() {
        let max_number = 1000;
        let mut prime_numbers = Vec::new();
        let mut numbers: Vec<_> = (2..=max_number).collect();

        while let Some(&n) = numbers.first() {
            if n * n > max_number {
                break;
            }
            prime_numbers.push(n);numbers = numbers.iter().filter(|&x| x % n != 0).cloned().collect();
        }
        prime_numbers.append(&mut numbers);
        println!("{:?}", prime_numbers);
    }

    ```,
)

= 数式

#set math.equation(numbering: "(1)")

円周率の式は@f1\で求まる．

$
    pi = 4 dot sum_(n=0)^(infinity) (-1)^n / (2n+1)
$ <f1>


= 画像 <kadai4>

// #figure(image("picture.png"), supplement: "aaa", caption: "hoge") <image>

#img(imagedata: "picture.png", caption: "画像のキャプション", ref: <image>)
#img(imagedata: image("picture.png", width: 50%), caption: "小さくした画像画像", ref: <image2>)

@image を参照

@image2 を参照

= 見出しの参照 <kadai5>

@kadai5 を参照.@kadai4\みたいに参照できます。

