#include <bits/stdc++.h>
using namespace std;

int main() {
    // 入力
    long long N, L, K;
    cin >> N >> L >> K;
    vector<long long> A(N);
    for (int i = 0; i < N; ++i) cin >> A[i];

    // 判定問題
    // すべての長さを x 以上にすることが可能か？
    auto check = [&](long long x) -> bool {
        long long num = 0; // 何個に切れたか
        long long pre = 0; // 前回の切れ目
        for (int i = 0; i < N; ++i) {
            // x を超えたら切断
            if (A[i] - pre >= x) {
                ++num;
                pre = A[i];
            }
        }
        // 最後のピースが x 以上なら加算
        if (L - pre >= x) ++num;

        return (num >= K + 1);
    };

    // 二分探索
    long long left = -1, right = L + 1;
    while (right - left > 1) {
        long long mid = (left + right) / 2;
        if (check(mid)) left = mid;
        else right = mid;
    }
    cout << left << endl;
}