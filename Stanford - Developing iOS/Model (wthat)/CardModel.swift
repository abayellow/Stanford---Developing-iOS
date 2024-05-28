import Foundation

struct Card: Hashable {
    
    // MARK: - Static properties
    
//    var hashValue: Int { return identifer }
    
    private static var cardIdentifier = 0
    private static func getID() -> Int {
        cardIdentifier += 1
        return cardIdentifier
    }
    //    MARK: - Static methods
    static func == (leftCard: Card, rightCard: Card) -> Bool {
           return leftCard.identifer == rightCard.identifer
       }
    // MARK: - Properties
    var isFaceUp = false
    var isMathed = false
    var identifer: Int
    
    // MARK: - Initializer
    init() {
        self.identifer = Card.getID()
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(identifer)
        }
    
}

