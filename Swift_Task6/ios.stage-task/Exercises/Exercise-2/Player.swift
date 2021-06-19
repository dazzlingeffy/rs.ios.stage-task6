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
        false
    }
}
