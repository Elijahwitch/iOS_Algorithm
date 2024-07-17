import Foundation

// Heap
// algorithm for search min value or max value

// Min-Heap implementation
struct MinHeap<T: Comparable> {
    private var heap: [T] = []
    
    
    var count: Int {
        return heap.count
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    
    
    // Helper function to get parent index
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // Helper function to get left child index
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    // Helper function to get right child index
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
    // Helper function to swap elements
    private mutating func swap(at index1: Int, with index2: Int) {
        let temp = heap[index1]
        heap[index1] = heap[index2]
        heap[index2] = temp
    }
    
    
    // Insert an element into the heap
    mutating func insert(_ value: T) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }
    
    // Helper function to maintain heap property after insertion
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let childValue = heap[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)
        
        while childIndex > 0 && childValue < heap[parentIndex] {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        
        heap[childIndex] = childValue
    }
    
    // Remove and return the minimum element (root) from the heap
    mutating func removeMin() -> T? {
        guard !heap.isEmpty else { return nil }
        
        if heap.count == 1 {
            return heap.removeFirst()
        } else {
            let min = heap[0]
            heap[0] = heap.removeLast()
            siftDown(from: 0)
            return min
        }
    }
    
    // Helper function to maintain heap property after deletion
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        let parentValue = heap[parentIndex]
        
        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex)
            let rightChildIndex = self.rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex
            
            if leftChildIndex < heap.count && heap[leftChildIndex] < heap[candidateIndex] {
                candidateIndex = leftChildIndex
            }
            
            if rightChildIndex < heap.count && heap[rightChildIndex] < heap[candidateIndex] {
                candidateIndex = rightChildIndex
            }
            
            if candidateIndex == parentIndex {
                return
            }
            
            heap[parentIndex] = heap[candidateIndex]
            parentIndex = candidateIndex
        }
        
        heap[parentIndex] = parentValue
    }
    
    // Peek at the minimum element without removing it
    func peek() -> T? {
        return heap.first
    }
}



// Usage example
var minHeap = MinHeap<Int>()
minHeap.insert(10)
minHeap.insert(20)
minHeap.insert(5)
minHeap.insert(7)

print("Min element: \(minHeap.peek() ?? -1)") // Output: Min element: 5

while !minHeap.isEmpty {
    print(minHeap.removeMin() ?? -1) // Output: 5, 7, 10, 20
}

