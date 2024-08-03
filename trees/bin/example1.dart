import 'dart:io' show stdin;

void main() {
  final tree = BinaryTree();
  tree.start();
  print(tree);
}

class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);

  @override
  String toString() => '$value->$left\n->$right';
}

class BinaryTree {
  Node? root;

  void start() {
    print("Enter the value of the root node");
    final value = int.tryParse((stdin.readLineSync() ?? "").trim());
    if (value == null) {
      print("Invalid value");
      return;
    }
    root = Node(value);
    populate(root);
  }

  void populate(Node? node) {
    if (node == null) return;

    print("Do you want to fill the left node of ${node.value}?");
    final left = bool.tryParse((stdin.readLineSync() ?? "false").trim());
    if (left == null) return;

    if (left) {
      print("Enter the value of the left node");
      final value = int.tryParse((stdin.readLineSync() ?? "").trim());
      if (value == null) {
        print("Invalid value");
        return;
      }
      node.left = Node(value);
      populate(node.left);
    }

    print("Do you want to fill the right node of ${node.value}?");
    final right = bool.tryParse((stdin.readLineSync() ?? "false").trim());
    if (right == null) return;

    if (right) {
      print("Enter the value of the right node");
      final value = int.tryParse((stdin.readLineSync() ?? "").trim());
      if (value == null) {
        print("Invalid value");
        return;
      }
      node.right = Node(value);
      populate(node.right);
    }
  }

  String display(Node? node, int level, String result) {
    if (node == null) return "";

    result += display(node.right, level + 1, "");

    for (int i = 0; i < level; i++) {
      result += "|\t\t";
    }
    result += "|-------->${node.value}\n";

    result += display(node.left, level + 1, "");
    return result;
  }

  @override
  String toString() => display(root, 0, "");
}
