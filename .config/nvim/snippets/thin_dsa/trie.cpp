class NodeData {};

class TrieNode {
  public:
    TrieNode *children[26];
    NodeData data;
    TrieNode() { memset(children, 0, sizeof(children)); }
};

// Function to insert a word into the trie
void insert(TrieNode *root, const string &word) {
    TrieNode *node = root;
    for (int i = 0; i < (int)word.size(); ++i) {
        int c = word[i] - 'a';
        if (!node->children[c]) {
            node->children[c] = new TrieNode();
        }
        node = node->children[c];
    }
}

// Function to search for a word in the trie
NodeData search(TrieNode *root, const string &word) {
    TrieNode *node = root;
    for (int i = 0; i < (int)word.size(); ++i) {
        int c = word[i] - 'a';
        if (!node->children[c]) {
            // Return default NodeData if word is not found
            return NodeData();
        }
        node = node->children[c];
    }
    return node->data;
}

// Function to delete the trie and free memory
void deleteTrie(TrieNode *node) {
    if (!node)
        return;
    for (int i = 0; i < 26; ++i) {
        if (node->children[i]) {
            deleteTrie(node->children[i]);
            node->children[i] = nullptr; // Optional: prevent dangling pointers
        }
    }
    delete node;
}

