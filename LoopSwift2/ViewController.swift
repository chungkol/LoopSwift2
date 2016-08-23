//
//  ViewController.swift
//  LoopSwift2
//
//  Created by Chung on 8/23/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flag = true
    
    var  lastOnLed = -1
    var margin:CGFloat = 40
    var margin1:CGFloat = 80
    var n: Int = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBall()
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
    }
    func runningLed() {
        
        if(lastOnLed != -1){
            turnOffLed()
        }
        
        if flag {
            if (lastOnLed != n - 1) {
                if flag {
                    lastOnLed = lastOnLed + 1
                }
            }else{
                flag = false
            }
        } else {
            lastOnLed = lastOnLed - 1
            if lastOnLed == 0 {
                flag = true
            }
        
        }
        turnOnLed()
        
    }
    
    func turnOnLed(){
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView{
            ball.image = UIImage(named: "green")
        }
    }
    func turnOffLed(){
        if let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView{
            ball.image = UIImage(named: "grey")
        }
    }
    
    func drawBall(){
        for indexRow in 0..<n{
            for indexCol in 0..<n{
                let image = UIImage(named: "green")
                let ball  = UIImageView(image: image)
                ball.center = CGPointMake(margin + CGFloat(indexRow) * spaceRow(n), 80 + CGFloat(indexCol) * spaceCol(n))
                ball.tag = indexRow + 100
                self.view.addSubview(ball)
            }
            
        }
    }
    
    func spaceRow(n: Int) -> CGFloat {
        return (self.view.bounds.size.width - 2*margin)/CGFloat(n-1)
    }
    
    func spaceCol(n: Int) -> CGFloat {
        return (self.view.bounds.size.height - 2*margin1)/CGFloat(n-1)
    }
    
    
    
}

