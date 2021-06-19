import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
    
    mutating func next(){
        self = Suit(rawValue: rawValue + 1) ?? Suit(rawValue: 0)!
    }
}

enum Value: Int, Codable, CaseIterable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
    
    mutating func next(){
        self = Value(rawValue: rawValue + 1) ?? Value(rawValue: 0)!
    }
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {

    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.suit == rhs.suit && lhs.value == rhs.value && lhs.isTrump == rhs.isTrump {
            return true
        }
        return false
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        var res = false
        if self.isTrump && !card.isTrump {
            res = true
        } else if self.suit == card.suit && self.value.rawValue > card.value.rawValue {
            res = true
        }
        return res
    }

    func checkValue(card: Card) -> Bool {
        return false
    }
}
