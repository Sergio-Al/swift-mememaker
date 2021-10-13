//
//  ViewController.swift
//  Mememaker
//
//  Created by Sergio Alejandro Machaca Lamas on 13/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topSegmentControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBAction func topSegmentAction(_ sender: Any) {
        setCaption(forTopCaptionIndex: topSegmentControl.selectedSegmentIndex, forBottomCaptionIndex: bottomSegmentControl.selectedSegmentIndex)
    }
    
    var topChoices = [CaptionOption]()
    var bottomChoices = [CaptionOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topChoices.append(CaptionOption(emojiCaption: "🧐", textCaption: "When ask you to find something"))
        topChoices.append( CaptionOption(emojiCaption: "🤖", textCaption: "When you compile doesn't work"))
        topChoices.append(CaptionOption(emojiCaption: "💼", textCaption: "When you go to work"))
        bottomChoices.append(CaptionOption(emojiCaption: "👑", textCaption: "But it's something that you lost"))
        bottomChoices.append(CaptionOption(emojiCaption: "🧠", textCaption: "and you don't remember anything"))
        bottomChoices.append(CaptionOption(emojiCaption: "🌮", textCaption: "But you only think in food"))
        
        topSegmentControl.removeAllSegments()
        bottomSegmentControl.removeAllSegments()
        
        for choice in topChoices {
            topSegmentControl.insertSegment(withTitle: choice.emojiCaption, at: topChoices.count, animated: false)
        }
        
        for choice in bottomChoices {
            bottomSegmentControl.insertSegment(withTitle: choice.emojiCaption, at: bottomChoices.count, animated: false)
        }
        
        topSegmentControl.selectedSegmentIndex = 0
        bottomSegmentControl.selectedSegmentIndex = 0
        
        setCaption(forTopCaptionIndex: topSegmentControl.selectedSegmentIndex, forBottomCaptionIndex: bottomSegmentControl.selectedSegmentIndex)
    }
    
    func setCaption(forTopCaptionIndex:Int, forBottomCaptionIndex:Int) {
        topCaptionLabel.text = topChoices[forTopCaptionIndex].textCaption
        bottomCaptionLabel.text = bottomChoices[forBottomCaptionIndex].textCaption
    }
    
    @IBAction func dragToTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragToBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    

}

