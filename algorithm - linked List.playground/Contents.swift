class Node<T> {
    var value: T
    var next: Node?

    init(value: T) {
        self.value = value
        self.next = nil
    }
}

class LinkedList<T> {
    // inherited, class variable with optional type.
    var head: Node<T>?

    func append(value: T) {
        
        let newNode = Node(value: value)
        
        if let lastNode = head {
            var current = lastNode
            // 마지막 노드가 앞부분에 다다랐을때, 다음 노드가 없을때
            
            while current.next != nil {
                current = current.next!
            }
            current.next = newNode
        } else {
            head = newNode
        }
    }

    func printList() {
        var current = head
        while current != nil {
            print(current!.value)
            current = current!.next
        }
    }
}

let linkedList = LinkedList<Int>()
linkedList.append(value: 1)
linkedList.append(value: 2)
linkedList.append(value: 3)

print("Elements in the linked list:")
linkedList.printList()

