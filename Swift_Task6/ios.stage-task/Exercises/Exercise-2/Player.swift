//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        var res = false
        let cardsToToss = self.hand?.compactMap { c in
            c.value == card.value ? c : nil
        }
        if cardsToToss!.count > 0 {
            res = true
        }
        return res
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        let handValues = hand?.map { $0.value }
        let matches = table.compactMap {
            (handValues?.contains($0.value))! || (handValues?.contains($1.value))! ? $0 : nil
        }
        if matches.count > 0 {
            return true
        }
        return false
    }
}
