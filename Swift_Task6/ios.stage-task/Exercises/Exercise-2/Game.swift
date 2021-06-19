//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var min: Card?
        var res: Player?
        
        for player in players {
            let trumps = player.hand?.compactMap { card in
                return card.isTrump ? card : nil
            }
            let tmp = (trumps?.min { $0.value.rawValue < $1.value.rawValue })!
            if (min == nil) || (min?.value.rawValue)! > (tmp.value.rawValue) {
                min = tmp
                res = player
            }
        }
        return res
    }
}
