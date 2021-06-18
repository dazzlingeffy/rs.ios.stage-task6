import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var suit = Suit.clubs
        var value = Value.six
        var cards = [Card]()
        var i = 0
        while i < 9 {
            cards.append(Card(suit: suit, value: value))
            if i == 8 && suit == Suit.diamonds {
                return cards
            } else if i == 8 {
                suit.next()
                value.next()
                i = 0
            } else {
                value.next()
                i += 1
            }
        }
        return cards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public func defineTrump() {

    }

    public func initialCardsDealForPlayers(players: [Player]) {

    }

    public func setTrumpCards(for suit:Suit) {

    }
}

