//
//  main.swift
//  디스크 컨트롤러
//
//  Created by 김수환 on 2021/03/15.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var jobQueue = jobs
        .map { Job(requestTime: $0[0], requiredTime: $0[1]) }
        .sorted { $0.requestTime < $1.requestTime }
    var shortestJobQueue = PriorityQueue<Job>(sortBy: { $0.requiredTime < $1.requiredTime })
    
    var currentTime = 0
    var totalDelay = 0
    while !shortestJobQueue.isEmpty || !jobQueue.isEmpty {
        // 현재 시간을 기준으로 요청된 모든 작업들을 우선순위 큐에 집어넣음
        while let job = jobQueue.first, job.requestTime <= currentTime {
            shortestJobQueue.push(job)
            jobQueue.removeFirst()
        }
        
        // 대기중인 작업 중 소요시간이 가장 짧은 작업을 처리
        if let nextJob = shortestJobQueue.pop() {
            currentTime += nextJob.requiredTime
            totalDelay += currentTime - nextJob.requestTime
        } else {
            // 대기중인 작업이 없으면 다음 작업의 요청이 오는 시간까지 스킵
            currentTime = jobQueue.first!.requestTime
        }
    }
    
    return totalDelay / jobs.count
}

struct Job {
    let requestTime: Int
    let requiredTime: Int
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

let jobs1 = [[0, 3], [1, 9], [2, 6]]
let jobs2 = [[0, 10], [2, 10], [25, 10], [25, 2]]

print(solution(jobs1))  // 9
print(solution(jobs2))  // 10
