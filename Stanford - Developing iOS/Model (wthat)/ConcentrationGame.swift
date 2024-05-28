import Foundation


class concentrationGame {
    
    //  MARK: - Properties
    private(set) var cards = [Card]()
    private var indexOfOnlyFaceUpCard: Int? {
        get {
            // MARK: Filal variant:
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
            
            // MARK: 2 variant :
//            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
            // MARK: 1st variant
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    //  MARK: - Methodth
    func shoosedCardAt(index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCardAt(index \(index)): chossen index not in the cards")
        
        if !cards[index].isMathed {
            if let getIndex = indexOfOnlyFaceUpCard, indexOfOnlyFaceUpCard != index {
                if cards[getIndex] == cards[index] {
                    cards[getIndex].isMathed = true
                    cards[index].isMathed = true
                }
                cards[index].isFaceUp = true
//                indexOfOnlyFaceUpCard = nil
            } else {
//                for downIndex in cards.indices {
//                    cards[downIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOnlyFaceUpCard = index
            }
        }
    }

    //  MARK: - Initializer
    init(numberOfPairCards: Int) {
        assert(numberOfPairCards > 0, "Concentration.init(\(numberOfPairCards)): you must have at least one pair of cards ")

        for _ in 1...numberOfPairCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
