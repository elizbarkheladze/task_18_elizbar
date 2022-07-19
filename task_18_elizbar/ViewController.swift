//
//  ViewController.swift
//  task_18_elizbar
//
//  Created by alta on 7/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSquare: UIImageView!
    
    @IBOutlet weak var blueSquare: UIImageView!
    @IBOutlet weak var purpleTri: UIImageView!
    
    @IBOutlet weak var blackTri: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        redTap()
        blueTap()
        purpleTap()
        blackTap()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackgroundColor), name: Notification.Name("Elizbar-Personal.task-18-elizbar.colorChange"), object: nil)
    }
    
    

}





extension ViewController {
    //functions
    @objc func changeBackgroundColor(notification: Notification) {
        if let color = notification.userInfo?["color"] as? UIColor {
            self.view.backgroundColor = color
        }
    }
    func redTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(redTapFunc))
        redSquare.addGestureRecognizer(tapGesture)
    }
    
    @objc func redTapFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        vc.indicator = "red"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func blueTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blueTapFunc))
        blueSquare.addGestureRecognizer(tapGesture)
    }
    
    @objc func blueTapFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        vc.indicator = "blue"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func purpleTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(purpleTapFunc))
        purpleTri.addGestureRecognizer(tapGesture)
    }
    
    @objc func purpleTapFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        vc.indicator = "purple"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func blackTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(blackTapFunc))
        blackTri.addGestureRecognizer(tapGesture)
    }
    
    @objc func blackTapFunc() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        vc.indicator = "black"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
