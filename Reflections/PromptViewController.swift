import UIKit

class PromptViewController: UIViewController {
    var flippedView = false
    
    // MARK: Front view
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var promptTypeLabel: UILabel!
    @IBOutlet weak var frontInstructionLabel: UILabel!
    
    // MARK: Back view
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var promptTextLabel: UILabel!
    @IBOutlet weak var backInstructionLabel: UILabel!
    
    @IBAction func flipButton(_ sender: Any) {
        flippedView = !flippedView
        
        let fromView = flippedView ? frontView : backView
        let toView = flippedView ? backView : frontView
        
        UIView.transition(from: fromView!, to: toView!, duration: 0.4, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

