//
//  main.swift
//  이중우선순위큐
//
//  Created by 김수환 on 2021/03/16.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var minHeap = PriorityQueue<Int>(sortBy: <)
    var maxHeap = PriorityQueue<Int>(sortBy: >)
    
    let parsedOperations: [(command: String, number: Int)] = operations.map {
        let operation = $0.components(separatedBy: .whitespaces)
        return (operation[0], Int(operation[1])!)
    }
    for (command, number) in parsedOperations {
        if command == "I" {
            // 큐에 주어진 숫자를 삽입
            minHeap.push(number)
            maxHeap.push(number)
        } else {
            if number > 0 {
                // 큐에서 최댓값을 삭제
                if let maxNumber = maxHeap.pop() {
                    minHeap.remove(maxNumber)
                }
            } else {
                // 큐에서 최솟값을 삭제
                if let minNumber = minHeap.pop() {
                    maxHeap.remove(minNumber)
                }
            }
        }
    }
    
    return [maxHeap.peek() ?? 0, minHeap.peek() ?? 0]
}

struct PriorityQueue<Element> {
    fileprivate var heap = [Element]()
    private let ordered: (Element, Element) -> Bool
    
    var count: Int { heap.count }
    var isEmpty: Bool { heap.isEmpty }
    
    init(sortBy: @escaping (Element, Element) -> Bool) {
        self.ordered = sortBy
    }
    
    mutating func push(_ element: Element) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        guard !heap.isEmpty else {
            return nil
        }
        
        if heap.count == 1 {
            return heap.removeFirst()
        } else {
            heap.swapAt(0, heap.count - 1)
            let value = heap.removeLast()
            sink(0)
            return value
        }
    }
    
    func peek() -> Element? {
        heap.first
    }
    
    private mutating func swim(_ index: Int) {
        var childIndex = index
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && !ordered(heap[parentIndex], heap[childIndex]) {
            heap.swapAt(parentIndex, childIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    private mutating func sink(_ index: Int) {
        var parentIndex = index
        
        while 2 * parentIndex + 1 < heap.count {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = leftChildIndex + 1
            
            var swapTargetIndex = leftChildIndex
            if leftChildIndex < (heap.count - 1) && !ordered(heap[leftChildIndex], heap[rightChildIndex]) {
                swapTargetIndex = rightChildIndex
            }
            if ordered(heap[parentIndex], heap[swapTargetIndex]) {
                break
            }
            
            heap.swapAt(parentIndex, swapTargetIndex)
            parentIndex = swapTargetIndex
        }
    }
}

extension PriorityQueue where Element: Comparable {
    mutating func remove(_ element: Element) {
        if let index = heap.firstIndex(of: element) {
            heap.swapAt(index, heap.count - 1)
            heap.removeLast()
            
            if index < heap.count {
                swim(index)
                sink(index)
            }
        }
    }
}

let operations1 = ["I 16","D 1"]
let operations2 = ["I 7", "I 5", "I -5", "D -1"]
let operations3 = ["I 5", "I 6", "D 1", "D -1", "I 1"]

print(solution(operations1))    // [0, 0]
print(solution(operations2))    // [7, 5]
print(solution(operations3))    // [1, 1]
