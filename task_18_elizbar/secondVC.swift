//
//  secondVC.swift
//  task_18_elizbar
//
//  Created by alta on 7/19/22.
//

import UIKit

class secondVC: UIViewController {
    var startTime : NSDate?
    var indicator = ""
    @IBOutlet weak var actionImage: UIImageView!
    @IBOutlet weak var heightofactionImage: NSLayoutConstraint!
    @IBOutlet weak var widthofactionImage: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        if indicator == "red" || indicator == "blue"{
            addLongPress()
        }
        else if indicator == "purple" {
            addSwipe()
        } else if indicator == "black"{
            addPinch()
        }
       
    }
}

extension secondVC {
    //functions
    
    func addLongPress() {
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        actionImage.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc func longPressed(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            startTime = NSDate()
        }
        else if gesture.state == .ended {
            let duration = NSDate().timeIntervalSince(startTime! as Date)
            if duration < 1 && indicator == "red"{
                self.navigationController?.popToRootViewController(animated: true)
            }else if duration > 1 && indicator == "blue"{
                UIView.transition(with: actionImage, duration: 0.33,
                  options: [.curveEaseOut, .transitionFlipFromBottom],
                  animations: {
                    self.actionImage.alpha = 0
                  },
                  completion: { _ in
                    self.actionImage.isHidden = true
                  }
                )
                
                
            }
            
        }
        
    }
    
    func addSwipe() {
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        rightSwipeGesture.direction = .right
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        leftSwipeGesture.direction = .left
        
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        upSwipeGesture.direction = .up
        
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        downSwipeGesture.direction = .down
        
        actionImage.addGestureRecognizer(rightSwipeGesture)
        actionImage.addGestureRecognizer(leftSwipeGesture)
        actionImage.addGestureRecognizer(upSwipeGesture)
        actionImage.addGestureRecognizer(downSwipeGesture)

    }
    
    @objc func swipedOnView(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:
            widthofactionImage.constant += 50
            print("left")
        case .right:
            widthofactionImage.constant -= 50
            print("right")
        case .up:
            heightofactionImage.constant += 50
            print("up")
        case .down:
            heightofactionImage.constant -= 50
            print("down")
        default:
           print("other")
        }
    }
    
    func addPinch() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        actionImage.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinched(gesture: UIPinchGestureRecognizer) {
        if gesture.state == .changed {
            let scale = gesture.scale
            gesture.scale = 1
            widthofactionImage.constant = widthofactionImage.constant*scale
            heightofactionImage.constant = heightofactionImage.constant*scale
            actionImage.center = self.view.center
            if widthofactionImage.constant > self.view.frame.width || heightofactionImage.constant > self.view.frame.height {
                widthofactionImage.constant = 100
                heightofactionImage.constant = 100
            }
            let color = ["color": UIColor(red: CGFloat.random(in: 0.0..<1.0), green: CGFloat.random(in: 0.0..<1.0), blue: CGFloat.random(in: 0.0..<1.0), alpha: 1.0)]
            NotificationCenter.default.post(name: Notification.Name("Elizbar-Personal.task-18-elizbar.colorChange"), object: nil, userInfo: color)
        }
        
    }
}
