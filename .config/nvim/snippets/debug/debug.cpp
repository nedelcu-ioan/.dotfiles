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
