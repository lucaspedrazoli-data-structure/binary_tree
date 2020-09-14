// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var tree: BinaryNode<Int> = {
  let zero = BinaryNode(value: 0)
  let one = BinaryNode(value: 1)
  let five = BinaryNode(value: 5)
  let seven = BinaryNode(value: 7)
  let eight = BinaryNode(value: 8)
  let nine = BinaryNode(value: 9)

  seven.leftChild = one
  one.leftChild = zero
  one.rightChild = five
  seven.rightChild = nine
  nine.leftChild = eight
  return seven
}()

var tree2: BinaryNode<Int> = {

  let root = BinaryNode(value: 15)
  let ten = BinaryNode(value: 10)
  let five = BinaryNode(value: 5)
  let twelve = BinaryNode(value: 12)
  let twentyFive = BinaryNode(value: 25)
  let seventeen = BinaryNode(value: 17)

  root.leftChild = ten
  root.rightChild = twentyFive
  ten.leftChild = five
  ten.rightChild = twelve
  twentyFive.leftChild = seventeen

  return root
}()

func height<T>(of node: BinaryNode<T>?) -> Int {
  guard let node = node else {
    return -1
  }

  return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
}

example(of: "tree diagram") {
  print(tree)
}

example(of: "in-order traversal") {
  tree.traverseInOrder { print($0) }
}

example(of: "pre-order traversal") {
  tree.traversePreOrder { print($0) }
}

example(of: "post-order traversal") {
  tree.traversePostOrder { print($0) }
}

example(of: "tree height") {
  let nodeHeight = height(of: tree)
  print("height: \(nodeHeight)")
}

example(of: "binatry tree to array") {
  print(tree2.toArray())
}
