import UIKit

class PromptViewController: UIViewController {
    var flippedView = false
    var content = Content()
    var random = RandomModel()
    let contentTypeLabels = ["?", "!"]
    var lists: [[String]]!
    
    // MARK: Front view
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var promptTypeLabel: UILabel!
    @IBOutlet weak var frontInstructionLabel: UILabel!
    
    // MARK: Back view
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var promptTextLabel: UILabel!
    @IBOutlet weak var backInstructionLabel: UILabel!
    
    let swipeRightGesture = UISwipeGestureRecognizer()
    
    @IBAction func flipButton(_ sender: Any) {
        flippedView = !flippedView
        
        let fromView = flippedView ? frontView : backView
        let toView = flippedView ? backView : frontView
        
        UIView.transition(from: fromView!, to: toView!, duration: 0.4, options: [.transitionFlipFromLeft, .showHideTransitionViews])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lists = [content.questionsList, content.answersList]
        updatePrompt()
        
        swipeRightGesture.addTarget(self, action: #selector(updatePrompt))
        swipeRightGesture.direction = .right
        self.view!.addGestureRecognizer(swipeRightGesture)
    }
    
    @objc func updatePrompt() {
        let randomTypeIndex = random.generateRandomIndex(from: lists)
        let randomPromptIndex = random.generateRandomIndex(from: lists[randomTypeIndex])
        promptTypeLabel.text = contentTypeLabels[randomTypeIndex]
        promptTextLabel.text = lists[randomTypeIndex][randomPromptIndex]
    }
    
}

