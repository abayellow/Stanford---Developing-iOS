import UIKit

final class ViewController: UIViewController {
    
    //      MARK: - IBOutlets
    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var touchesLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    //    MARK: - Properties
    private lazy var game = concentrationGame(numberOfPairCards: numberOfPairsOfCards)
    private var numberOfPairsOfCards: Int { (buttonCollection.count + 1) / 2 }
    private var touchesCount = 0  {
        didSet {
            updateFlipCountLabel()
        }
    }
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.orange
        ]
        let attributedString = NSAttributedString(string: "Flips: \(touchesCount)", attributes: attributes)
        touchesLabel.attributedText = attributedString
    }
    private var emojiCollection = ["👻", "👽", "🐓", "🐸", "🦇", "🦊", "🎃", "🌺"]
    private var emojiDictionary = [Card:String]()
    
    //    MARK: - Methods
    private func chooseEmoji(card: Card) -> String {
        if emojiDictionary[card] == nil {
            let randomIndex = Int.random(in: 0..<emojiCollection.count)
            emojiDictionary[card] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card] ?? "🚫"
    }
    
    private func updateView() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(chooseEmoji(card: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMathed ? .black : .systemOrange
            }
        }
        
    }
    
    //      MARK: - IBActions
    @IBAction private func buttonToched(_ sender: UIButton) {
        touchesCount += 1
        let index = buttonCollection.firstIndex(of: sender)!
        game.shoosedCardAt(index: index)
        updateView()
    }
}

