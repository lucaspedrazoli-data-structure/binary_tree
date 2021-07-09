# binary_tree
* The value of a left child must be less than the value of its parent.
* Consequently, the value of a right child must be greater than or equal to the value of its parent.
#### Binary search trees use this property to save you from performing unnecessary checking. As a result, lookup, insert and removal have an average time complexity of O(log n)

```
class BinaryNode<Element> {
  public var value: Element
  public var leftChild: BinaryNode?
  public var rightChild: BinaryNode?
  
  public init(value: Element) {
    self.value = value
  }

  func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }
  
  func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }
  
  public func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
  
  func height(of node: BinaryNode?) -> Int {
    return 1 + max(height(of: tree.leftChild), height(of:tree.rightChild))
  }
  
  func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.traversePreOrder { array.append($0) }
    return array
  }
  
  func deserialize<T>(_ array: inout [T]) -> BinaryNode<T>? {
    let node = BinaryNode(value: value)
    node.leftChild = deserialize(&array)
    node.rightChild = deserialize(&array)
    return node
  }
}
```
