import Foundation

// Queue, First in First out

protocol Queueable {
    associatedtype Element
    
    // append element at back of array
    mutating func enqueue(_ newElement: Element)
    
    // append element at before of array
    mutating func dequeue() -> Element?
}

struct Array<Element>: Queueable {
    
    private var array = [Element]()
    
    mutating func enqueue(_ newElement: Element) {
        array.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        
        guard let first = array.first else { return nil }
        
        return  array.removeFirst() // 빈 배열에서 호출하면 런타임 에러 발생
    }
}

// Stack
// Last in Firt Out.  후입선출, 마지막에 입력한 요소가 먼저 등장
struct DoubleStackQueue<Element>: Queueable {
    
    private var inStack = [Element]()
    private var outStack = [Element]()
    
    mutating func enqueue(_ newElement: Element) {
        inStack.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = inStack.reversed() // 뒤집기
            inStack.removeAll()
        }
        return outStack.popLast() // 에러 방지
    }
    
}

// Linked List

struct LinkedList<Element>: Queueable {
    
    
    class Node {
        let value: Element
        var next: Node?
        
        init(value: Element) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    
    mutating func enqueue(_ newElement: Element) {
        let newNode = Node(value: newElement)
        tail?.next = newNode
        
        if head == nil {
            head = newNode
        }
        
        tail = newNode
    }
    
    mutating func dequeue() -> Element? {
        let element = head?.value
        head = head?.next
        
        if head == nil {
            tail = nil
        }
        
        return element
    }
}
