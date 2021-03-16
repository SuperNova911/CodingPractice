//
//  main.swift
//  여행경로
//
//  Created by 김수환 on 2021/03/16.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.map {
        Ticket(departure: $0[0], arrival: $0[1])
    }
    
    return travel(destination: "ICN", remainTickets: tickets)
}

// DFS
func travel(destination currentAirport: String, remainTickets tickets: [Ticket]) -> [String] {
    // 남은 티켓 중 현재 공항에서 사용할 수 있는 티켓을 골라냄
    let usableTickets = tickets.filter { $0.departure == currentAirport }
    if usableTickets.isEmpty {
        return [currentAirport]
    }
    
    // 가장 많은 공항을 방문할 수 있는 경로를 계산
    var bestTravelRoute: (destination: String, route: [String]) = ("", [])
    for ticket in usableTickets {
        let destination = ticket.arrival
        let remainTickets = tickets.subtractingFirstMatch(ticket)
        
        let route = [currentAirport] + travel(destination: destination, remainTickets: remainTickets)
        
        // 더 많은 공항을 방문할 수 있는 경로를 선택
        // 방문할 수 있는 공항의 수가 같으면 알파벳 순서가 앞서는 경로를 선택
        if bestTravelRoute.route.count < route.count ||
            (bestTravelRoute.route.count == route.count && bestTravelRoute.destination >= destination) {
            bestTravelRoute = (destination, route)
        }
    }
    
    return bestTravelRoute.route
}

struct Ticket: Equatable {
    var departure: String
    var arrival: String
}

extension Array where Element: Equatable {
    func subtractingFirstMatch(_ element: Element) -> [Element] {
        var elements = self
        if let index = elements.firstIndex(of: element) {
            elements.remove(at: index)
        }
        return elements
    }
}

let tickets1 = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
let tickets2 = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
let tickets3 = [["ICN", "JFK"], ["ICN", "JFK"], ["ICN", "JFK"], ["JFK", "ICN"], ["JFK", "ICN"]]

print(solution(tickets1))   // ["ICN", "JFK", "HND", "IAD"]
print(solution(tickets2))   // ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
print(solution(tickets3))   // ["ICN", "JFK", "ICN", "JFK", "ICN", "JFK"]
