//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Pranav Bhandari on 8/14/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOver: UILabel!
    var activePlayer = 1 // 1 = noughts and 2 = crosses
    
    var boxes = [0,0,0,0,0,0,0,0,0]
    
    let winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6] ,[1,4,7],[2,5,8], [0,4,8] , [2,4,6]]
    
    var gameActive = true // true for still playing and false for gameOver
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func buttonPressed(sender: AnyObject) {
        if gameActive {
            if boxes[sender.tag] == 0 {
                if activePlayer == 1 {
                    sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                    activePlayer = 2
                    boxes[sender.tag] = 1
                } else {
                    sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                    activePlayer = 1
                    boxes[sender.tag] = 2
                }
            }
            self.checkWinner()
        }
        
    }
    
    func checkWinner() {
        for combinations in winningCombos {
            if boxes[combinations[0]] != 0 &&  boxes[combinations[0]] == boxes[combinations[1]] && boxes[combinations[1]] == boxes[combinations[2]]{
                if boxes[combinations[0]] == 1 {
                    UIView.animateWithDuration(0.5, animations: {
                        self.gameOver.hidden = false
                        self.gameOver.center = CGPointMake(self.gameOver.center.x + 1000, self.gameOver.center.y)
                        self.gameOver.text = "Noughts have won"
                        
                        //button
                        self.playAgainBtn.hidden = false
                        self.playAgainBtn.center = CGPointMake(self.playAgainBtn.center.x + 1000, self.playAgainBtn.center.y)
                    })
                } else {
                    UIView.animateWithDuration(0.5, animations: {
                        self.gameOver.hidden = false
                        self.gameOver.center = CGPointMake(self.gameOver.center.x + 1000, self.gameOver.center.y)
                        self.gameOver.text = "Crosses have won"
                        
                        //button
                        self.playAgainBtn.hidden = false
                        self.playAgainBtn.center = CGPointMake(self.playAgainBtn.center.x + 1000, self.playAgainBtn.center.y)
                    })
                }
                
                // disabling other buttons
                gameActive = false
            }
            
            gameActive = false
            
            for y in boxes {
                if boxes[y] == 0 {
                    gameActive = true
                }
            }
            
            if gameActive == false {
                self.gameOver.hidden = false
                self.gameOver.center = CGPointMake(self.gameOver.center.x + 1000, self.gameOver.center.y)
                self.gameOver.text = "Game has Drawn"
                
                //button
                self.playAgainBtn.hidden = false
                self.playAgainBtn.center = CGPointMake(self.playAgainBtn.center.x + 1000, self.playAgainBtn.center.y)
            }
        }
    }
    
    @IBAction func Restart(sender: AnyObject) {
        boxes = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        activePlayer = 1
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 1000, gameOver.center.y)
        playAgainBtn.hidden = true
        playAgainBtn.center = CGPointMake(playAgainBtn.center.x - 1000, playAgainBtn.center.y)
        var buttonToClear : UIButton!
        
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 1000, gameOver.center.y)
        playAgainBtn.hidden = true
        playAgainBtn.center = CGPointMake(playAgainBtn.center.x - 1000, playAgainBtn.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

