
/*
  (づ ￣ ³￣)づ
*/
#include "bits/stdc++.h"
#include <ext/pb_ds/assoc_container.hpp>

using namespace std;
using namespace __gnu_pbds;

#define sim template <class c
#define ris return *this
#define dor > debug &operator<<
#define eni(x)                                                                 \
    sim > typename enable_if<sizeof dud<c>(0) x 1, debug &>::type operator<<(  \
              c i) {
sim > struct rge {
    c b, e;
};
sim > rge<c> range(c i, c j) { return rge<c>{i, j}; }
sim > auto dud(c *x) -> decltype(cerr << *x, 0);
sim > char dud(...);
struct debug {
#ifdef LOCAL
    ~debug() { cerr << endl; }
    eni(!=) cerr << boolalpha << i;
    ris;
} eni(==) ris << range(begin(i), end(i));
}
sim, class b dor(pair<b, c> d) {
    ris << "(" << d.first << ", " << d.second << ")";
}
sim dor(rge<c> d) {
    *this << "[";
    for (auto it = d.b; it != d.e; ++it)
        *this << ", " + 2 * (it == d.b) << *it;
    ris << "]";
}
#else
    sim dor(const c &) { ris; }
#endif
}
;
#define imie(...) " [" << #__VA_ARGS__ ": " << (__VA_ARGS__) << "] "

template <typename T> std::string bit_rep(T n, size_t size) {
    std::bitset<sizeof(T) * 8> bits(n);
    std::string bitstr = bits.to_string();
    size_t start = bits.size() - size;
    std::string result;
    for (size_t i = start; i < bits.size(); ++i) {
        result += bitstr[i];
        if ((i - start + 1) % 4 == 0 && i != bits.size() - 1) {
            result += ' ';
        }
    }
    return result;
}

#define rep1(n) for (ll i = 0; i < (ll)(n); ++i)
#define rep2(i, n) for (ll i = 0; i < (ll)(n); ++i)
#define rep3(i, a, b) for (ll i = (ll)(a); i < (ll)(b); ++i)
#define rep4(i, a, b, c) for (ll i = (ll)(a); i < (ll)(b); i += (c))
#define cut4(a, b, c, d, e, ...) e
#define rep(...) cut4(__VA_ARGS__, rep4, rep3, rep2, rep1)(__VA_ARGS__)
#define per1(n) for (ll i = ((ll)n) - 1; i >= 0; --i)
#define per2(i, n) for (ll i = ((ll)n) - 1; i >= 0; --i)
#define per3(i, a, b) for (ll i = ((ll)a) - 1; i >= (ll)(b); --i)
#define per4(i, a, b, c) for (ll i = ((ll)a) - 1; i >= (ll)(b); i -= (c))
#define per(...) cut4(__VA_ARGS__, per4, per3, per2, per1)(__VA_ARGS__)
#define rep_subset(i, s)                                                       \
    for (ll i = (s); i >= 0; i = (i == 0 ? -1 : (i - 1) & (s)))

using ll = long long;
using u32 = unsigned int;
using u64 = unsigned long long;
using i128 = __int128;
using u128 = unsigned __int128;
using f128 = __float128;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

template <typename T> using vc = vector<T>;
template <typename T> using vvc = vc<vc<T>>;
template <typename T> using vvvc = vc<vvc<T>>;

using vi = vc<int>;
using vll = vc<ll>;
using vvi = vc<vi>;
using vvll = vc<vll>;
using vpii = vc<pii>;
using vpll = vc<pll>;

#define pb push_back
#define sz(a) ((int)a.size())
#define all(x) (x).begin(), (x).end()
#define rall(x) (x).begin(), (x).end()

template <typename T> using min_heap = priority_queue<T, vector<T>, greater<T>>;
template <typename T> using max_heap = priority_queue<T>;

template <typename T> constexpr T inf = 0;
template <> constexpr int inf<int> = 0x3f3f3f3f;
template <> constexpr ll inf<ll> = 0x3f3f3f3f3f3f3f3f;

template <typename T, typename S> constexpr T ifloor(const T a, const S b) {
    return a / b - (a % b && (a ^ b) < 0);
}
template <typename T, typename S> constexpr T iceil(const T a, const S b) {
    return ifloor(a + b - 1, b);
}

#define MULTIPLE_TEST_CASES
/// end of default template

void solve() {
    // solve problem here
}

signed main(int argc, char **argv, char **envp) {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);

#ifdef MULTIPLE_TEST_CASES
    int t;
    cin >> t;
    rep(t) { solve(); }
#else
    solve();
#endif
    return 0x0;
}
