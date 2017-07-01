import UIKit

class PromptViewController: UIViewController {
    var flippedView = false
    var canFlip = true
    
    var content = Content()
    var random = RandomModel()
    
    let contentTypeLabels = ["?", "!", ":"]
    var lists: [[String]]!
    
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var promptTypeLabel: UILabel!
    @IBOutlet weak var frontInstructionLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var promptTextLabel: UILabel!
    @IBOutlet weak var backInstructionLabel: UILabel!
    
    let swipeRightGesture = UISwipeGestureRecognizer()
    
    @IBAction func flipButton(_ sender: Any) {
        flippedView = !flippedView
        
        let fromView = flippedView ? frontView : backView
        let toView = flippedView ? backView : frontView
        
        canFlip = fromView == backView ? true : false
        
        UIView.transition(from: fromView!, to: toView!, duration: 0.4, options: [.transitionFlipFromLeft, .showHideTransitionViews])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        promptTypeLabel.textColor = UIColor.CustomColor.Black.Licorice
        frontInstructionLabel.textColor = UIColor.CustomColor.Black.Licorice
        promptTextLabel.textColor = UIColor.CustomColor.Black.Licorice
        backInstructionLabel.textColor = UIColor.CustomColor.Black.Licorice
        
        lists = [content.questionsList, content.answersList, content.phraseList]
        updatePrompt()
        
        swipeRightGesture.addTarget(self, action: #selector(updatePrompt))
        swipeRightGesture.direction = .right
        self.view!.addGestureRecognizer(swipeRightGesture)
    }
    
    @objc func updatePrompt() {
        if (canFlip) {
            let randomTypeIndex = random.generateRandomIndex(from: lists)
            let randomPromptIndex = random.generateRandomIndex(from: lists[randomTypeIndex])
            promptTypeLabel.text = contentTypeLabels[randomTypeIndex]
            promptTextLabel.text = lists[randomTypeIndex][randomPromptIndex]
            changeBackgroundColor(to: .red)
        } 
    }
    
    // MARK: Background color helper 
    func changeBackgroundColor(to color: UIColor) {
        self.frontView.backgroundColor = color
        self.backView.backgroundColor = color
        self.view.backgroundColor = color
    }
    
}

