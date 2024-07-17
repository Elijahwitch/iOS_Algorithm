//
//  Graph.swift
//  GraphTest
//
//  Created by Joon Ho Gwak on 7/2/24.
//

import Foundation

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

    func bfsLevels(startingFrom startValue: Int) -> [Int: Int] {
        guard let startNode = nodes[startValue] else {
            print("Starting node not found in graph")
            return [:]
        }

        var visited: Set<Int> = []
        var queue: [(Node, Int)] = [(startNode, 0)]
        var levelCount: [Int: Int] = [:]

        while !queue.isEmpty {
            let (currentNode, level) = queue.removeFirst()

            if visited.contains(currentNode.value) {
                continue
            }

            visited.insert(currentNode.value)
            levelCount[level, default: 0] += 1

            for neighbor in currentNode.neighbors {
                if !visited.contains(neighbor.value) {
                    queue.append((neighbor, level + 1))
                }
            }
        }

        return levelCount
    }
}
