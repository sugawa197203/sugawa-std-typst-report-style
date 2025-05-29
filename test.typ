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

// #fig("samplecode", "code1")[
//   ```rust
//   fn main() {
//       println!("Hello, world!");
//   }
//   ```
// ]

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

```


= 数式

円周率の式は@f1\で求まる．

$
  pi = 4 dot sum_(n=0)^(infinity) (-1)^n / (2n+1)
$ <f1>
