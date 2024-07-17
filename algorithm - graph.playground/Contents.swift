import Foundation

// Define the graph node
class Node {
    let value: Int
    var neighbors: [Node]

    init(value: Int) {
        self.value = value
        self.neighbors = []
    }
}

// Define the graph
class Graph {
    var nodes: [Int: Node]

    init() {
        self.nodes = [:]
    }

    func addNode(_ value: Int) {
        nodes[value] = Node(value: value)
    }

    func addEdge(from source: Int, to destination: Int) {
        guard let sourceNode = nodes[source], let destinationNode = nodes[destination] else {
            print("Invalid nodes for edge")
            return
        }
        sourceNode.neighbors.append(destinationNode)
        destinationNode.neighbors.append(sourceNode) // Comment this line for directed graph
    }

    func bfs(startingFrom startValue: Int) {
        guard let startNode = nodes[startValue] else {
            print("Starting node not found in graph")
            return
        }

        var visited: Set<Int> = []
        var queue: [Node] = [startNode]

        while !queue.isEmpty {
            let currentNode = queue.removeFirst()

            if visited.contains(currentNode.value) {
                continue
            }

            visited.insert(currentNode.value)
            print("Visited node: \(currentNode.value)")

            for neighbor in currentNode.neighbors {
                if !visited.contains(neighbor.value) {
                    queue.append(neighbor)
                }
            }
        }
    }
}

// Example usage
let graph = Graph()
graph.addNode(1)
graph.addNode(2)
graph.addNode(3)
graph.addNode(4)

graph.addEdge(from: 1, to: 2)
graph.addEdge(from: 1, to: 3)
graph.addEdge(from: 2, to: 4)
graph.addEdge(from: 3, to: 4)

print("Breadth-First Search starting from node 1:")
graph.bfs(startingFrom: 1)

