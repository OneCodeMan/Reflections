import UIKit

class PromptViewController: UIViewController {
    var flippedView = false
    var canFlip = true
    
    var content = Content()
    var random = RandomModel()
    var backgroundColors = BackgroundColors().backgroundColors
    
    let contentTypeLabels = ["?", "!", "..."]
    var lists: [[String]]!
    var originalList: [[String]]!
    
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
        
        let questions = content.questionsList
        let answers = content.answersList
        let phrases = content.phraseList
        
        originalList = [content.questionsList, content.answersList, content.phraseList]
        lists = [questions, answers, phrases]
        updatePrompt()
        
        swipeRightGesture.addTarget(self, action: #selector(updatePrompt))
        swipeRightGesture.direction = .right
        self.view!.addGestureRecognizer(swipeRightGesture)
        
        fadeLabel(label: backInstructionLabel, delay: 0)
        fadeLabel(label: frontInstructionLabel, delay: 0)
    }
    
    @objc func updatePrompt() {
        
        if (canFlip) {
            let randomTypeIndex = random.generateRandomIndex(from: lists)
            let randomPromptIndex = random.generateRandomIndex(from: lists[randomTypeIndex])
            var currentList = lists[randomTypeIndex]
            
            promptTypeLabel.text = contentTypeLabels[randomTypeIndex]
            promptTextLabel.text = lists[randomTypeIndex][randomPromptIndex]
            
            currentList.remove(at: randomPromptIndex) // avoid duplicates
            
            changeBackgroundColor()
            
            fadeLabel(label: backInstructionLabel, delay: 0.5)
            fadeLabel(label: frontInstructionLabel, delay: 0.5)
            
            if (currentList.count < 2) {
                currentList = originalList[randomTypeIndex]
            }
            
        }
        
    }
    
    // MARK: Background color helper 
    func changeBackgroundColor() {
        let randomColorIndex = random.generateRandomIndex(from: backgroundColors)
        let color = backgroundColors[randomColorIndex]
        self.frontView.backgroundColor = color
        self.backView.backgroundColor = color
        self.view.backgroundColor = color
    }
    
    // MARK: Animations
    func fadeLabel(label: UILabel, delay: TimeInterval) {
        let animationDuration = 3.0
        
        UIView.animate(withDuration: animationDuration, delay: 3.0, animations: { () -> Void in
            label.alpha = 1.0
        }) { (Bool) -> Void in
            
            UIView.animate(withDuration: animationDuration, delay: delay, options: [.curveEaseOut, .autoreverse, .repeat], animations: { () -> Void in
                label.alpha = 0
            }, completion: nil)
        }
        
    }
    
    // MARK: Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

