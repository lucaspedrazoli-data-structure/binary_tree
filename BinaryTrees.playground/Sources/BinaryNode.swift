import Foundation

public class BinaryNode<Element> {
  public var value: Element
  public var leftChild: BinaryNode?
  public var rightChild: BinaryNode?

  public init(value: Element) {
    self.value = value
  }
}

extension BinaryNode {

  public func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }

  public func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }

  public func traversePreOrderNil(visit: (Element?) -> Void) {
    visit(value)
    if leftChild == nil  {
      visit(nil)
    }
    leftChild?.traversePreOrderNil(visit: visit)
    if rightChild == nil {
      visit(nil)
    }
    rightChild?.traversePreOrderNil(visit: visit)
  }

  public func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }

  public func toArray() -> [Element?] {
    var array: [Element?] = []
    traversePreOrderNil { array.append($0) }
    return array
  }
}

extension BinaryNode: CustomStringConvertible {
  public var description: String {
    diagram(for: self)
  }

  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild,
                bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
