//
//  GameViewController.swift
//  Bowling
//
//  Created by DM on 2021/05/21.
//

import UIKit

class GameViewController: UIViewController {
    
    //view controller get nickname
    var player1 : String = ""
    var player2 : String = ""
    var player3 : String = ""
    var player4 : String = ""
    
    
    var frame : Int = 0 //frame number
    var gameCount : Int = 1 //first turn, second turn
    var continuousStrikeCount : Int = 0 //strike num
    var prevStrike : Bool = false
    var total : Int = 0
    var tenResult : Int = 1
    var firstRand = 0
    var secondRand = 0
    var spare = false
    
    //Player Label
    @IBOutlet var player1Label: UILabel!
    
    //first game result
    @IBOutlet var oneFrameResult1: UILabel!
    @IBOutlet var twoFrameResult1: UILabel!
    @IBOutlet var threeFrameResult1: UILabel!
    @IBOutlet var fourFrameResult1: UILabel!
    @IBOutlet var fiveFrameResult1: UILabel!
    @IBOutlet var sixFrameResult1: UILabel!
    @IBOutlet var sevenFrameResult1: UILabel!
    @IBOutlet var eightFrameResult1: UILabel!
    @IBOutlet var nineFrameResult1: UILabel!
    @IBOutlet var tenFrameResult1: UILabel!
    
    
    //second game result
    @IBOutlet var oneFrameResult2: UILabel!
    @IBOutlet var twoFrameResult2: UILabel!
    @IBOutlet var threeFrameResult2: UILabel!
    @IBOutlet var fourFrameResult2: UILabel!
    @IBOutlet var fiveFrameResult2: UILabel!
    @IBOutlet var sixFrameResult2: UILabel!
    @IBOutlet var sevenFrameResult2: UILabel!
    @IBOutlet var eightFrameResult2: UILabel!
    @IBOutlet var nineFrameResult2: UILabel!
    @IBOutlet var tenFrameResult2: UILabel!
    
    //last frame game result3
    @IBOutlet var tenFrameResult3: UILabel!
    
    //frame total
    @IBOutlet var oneFrameTotal: UILabel!
    @IBOutlet var twoFrameTotal: UILabel!
    @IBOutlet var threeFrameTotal: UILabel!
    @IBOutlet var fourFrameTotal: UILabel!
    @IBOutlet var fiveFrameTotal: UILabel!
    @IBOutlet var sixFrameTotal: UILabel!
    @IBOutlet var sevenFrameTotal: UILabel!
    @IBOutlet var eightFrameTotal: UILabel!
    @IBOutlet var nineFrameTotal: UILabel!
    @IBOutlet var tenFrameTotal: UILabel!
    
    @IBOutlet var strikeBtn: UIButton!
    @IBOutlet var randomBtn: UIButton!
    @IBOutlet var gameoverLabel: UILabel!
    
    //Strike click
    @IBAction func strikeBtnClicked(_ sender: UIButton) {
        prevStrike = true //이전 스트라이크 확인
        //first game
        if(gameCount == 1){
            continuousStrikeCount += 1
            
            if(frame != 10){
                frame += 1
            }
            
            if(frame == 1){
                oneFrameResult1.text = "X"
            }else if(frame == 2){
                
                if(continuousStrikeCount == 1 && spare == true){
                    
                    total += 20
                    oneFrameTotal.text = String(total)
                }
                twoFrameResult1.text = "X"
            }else if(frame == 3){
                threeFrameResult1.text = "X"
                if(continuousStrikeCount >= 3){
                    total += 30
                    oneFrameTotal.text = String(total)
                }

            }else if(frame == 4){
                fourFrameResult1.text = "X"
                if(continuousStrikeCount >= 3){
                    total += 30
                    twoFrameTotal.text = String(total)
                }
  
            }else if(frame == 5){
                fiveFrameResult1.text = "X"
                
                if(continuousStrikeCount >= 3){
                    total += 30
                    threeFrameTotal.text = String(total)
                }
       
            }else if(frame == 6){
                sixFrameResult1.text = "X"
                
                if(continuousStrikeCount >= 3){
                    total += 30
                    fourFrameTotal.text = String(total)
                }
  
            }else if(frame == 7){
                sevenFrameResult1.text = "X"
   
                if(continuousStrikeCount >= 3){
                    total += 30
                    fiveFrameTotal.text = String(total)
                }

            }else if(frame == 8){
                eightFrameResult1.text = "X"
   
                if(continuousStrikeCount >= 3){
                    total += 30
                    sixFrameTotal.text = String(total)
                }
       
            }else if(frame == 9){
                nineFrameResult1.text = "X"
                
                if(continuousStrikeCount >= 3){
                    total += 30
                    sevenFrameTotal.text = String(total)
                }
      
            }else if(frame == 10){

                if(tenResult == 1){
                    if(continuousStrikeCount >= 3){
                        total += 30
                        tenFrameResult1.text = "X"
                        eightFrameTotal.text = String(total)
                        tenResult += 1
                    }
                }else if(tenResult == 2){
                        total += 30
                        tenFrameResult2.text = "X"
                        nineFrameTotal.text = String(total)
                        tenResult += 1
                }else if(tenResult == 3){
                    total += 30
                    tenFrameResult3.text = "X"
                    tenFrameTotal.text = String(total)
                    strikeBtn.isHidden = true
                    randomBtn.isHidden = true
                    gameoverLabel.isHidden = false
                    
                    return
                }
            }
            spare = false
        }
        //second game
        else if(gameCount == 2){
            spare = true
            
            if(frame == 1){
                oneFrameResult2.text = "/"
            }else if(frame == 2){
                twoFrameResult2.text = "/"
            }else if(frame == 3){
                threeFrameResult2.text = "/"
            }else if(frame == 4){
                fourFrameResult2.text = "/"
            }else if(frame == 5){
                fiveFrameResult2.text = "/"
            }else if(frame == 6){
                sixFrameResult2.text = "/"
            }else if(frame == 7){
                sevenFrameResult2.text = "/"
            }else if(frame == 8){
                eightFrameResult2.text = "/"
            }else if(frame == 9){
                nineFrameResult2.text = "/"
            }else if(frame == 10){
                tenFrameResult2.text = "/"
            }
            gameCount = 1
        }
    }
    
    //Random click
    @IBAction func randomBtnClicked(_ sender: UIButton) {
        
        if(gameCount == 1){
            firstRand = Int(arc4random_uniform(11))
            
            if(frame != 10){
                frame += 1
            }
            //strike num add
            if(firstRand == 10){
                continuousStrikeCount += 1
            }
            
            if(frame == 1){
                if(firstRand == 0){
                    oneFrameResult1.text = "-"
                }else if(firstRand == 10) {
                    oneFrameResult1.text = "X"
                }
                else{
                    oneFrameResult1.text = String(firstRand)
                }
            }else if(frame == 2){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        twoFrameResult1.text = "-"
                        oneFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            oneFrameTotal.text = String(total)
                        }
                        twoFrameResult1.text = "X"
                    }else {
                        twoFrameResult1.text = String(firstRand)
                    }
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            oneFrameTotal.text = String(total)
                        }
                        twoFrameResult1.text = "-"
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            oneFrameTotal.text = String(total)
                        }
                        twoFrameResult1.text = "X"
                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            oneFrameTotal.text = String(total)
                        }
                        twoFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 3){
                
                if(continuousStrikeCount == 1){
                    print("1game")
                    if(firstRand == 0){
                        threeFrameResult1.text = "-"
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            twoFrameTotal.text = String(total)
                        }
                        twoFrameResult1.text = "X"
                    }else {
                        print("1g c")
                        total += 10 + firstRand
                        threeFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount == 2){
                    if(firstRand == 0){
                        threeFrameResult1.text = "-"
                        total += 20 + firstRand
                        oneFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            twoFrameTotal.text = String(total)
                        }
                        threeFrameResult1.text = "X"
                    }else {
                        total += 20 + firstRand
                        oneFrameTotal.text = String(total)
                        threeFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount > 2){
                    total += 30
                    oneFrameTotal.text = String(total)
                    threeFrameResult1.text = "X"
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                        twoFrameTotal.text = String(total)
                        }
                        
                        threeFrameResult1.text = "-"
                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            twoFrameTotal.text = String(total)
                        }
                        
                        threeFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 4){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        fourFrameResult1.text = "-"
                        threeFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            threeFrameTotal.text = String(total)
                        }
                        fourFrameResult1.text = "X"
                    }else {
                        total += 10 + firstRand
                        threeFrameTotal.text = String(total)
                        fourFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount == 2){
                    if(firstRand == 0){
                        fourFrameResult1.text = "-"
                        total += 20 + firstRand
                        twoFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            threeFrameTotal.text = String(total)
                        }
                        fourFrameResult1.text = "X"
                    }else {
                        total += 20 + firstRand
                        twoFrameTotal.text = String(total)
                        fourFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount > 2){
                    total += 30
                    twoFrameTotal.text = String(total)
                    fourFrameResult1.text = "X"
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            threeFrameTotal.text = String(total)
                        }
                        
                        fourFrameResult1.text = "-"
                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            threeFrameTotal.text = String(total)
                        }
                        
                        fourFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 5){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        fiveFrameResult1.text = "-"
                        fourFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            fourFrameTotal.text = String(total)
                        }
                        fiveFrameResult1.text = "X"
                    }else {
                        total += 10 + firstRand
                        fiveFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount == 2){
                    if(firstRand == 0){
                        fiveFrameResult1.text = "-"
                        total += 20 + firstRand
                        threeFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            fourFrameTotal.text = String(total)
                        }
                        fiveFrameResult1.text = "X"
                    }else {
                        total += 20 + firstRand
                        threeFrameTotal.text = String(total)
                        fiveFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount > 2){
                    total += 30
                    threeFrameTotal.text = String(total)
                    fiveFrameResult1.text = "X"
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            fourFrameTotal.text = String(total)
                        }
                        
                        fiveFrameResult1.text = "-"
                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            fourFrameTotal.text = String(total)
                        }
                        
                        fiveFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 6){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        sixFrameResult1.text = "-"
                        fiveFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            fiveFrameTotal.text = String(total)
                        }
                        sixFrameResult1.text = "X"
                    }else {
                        total += 10 + firstRand
                        sixFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount == 2){
                    if(firstRand == 0){
                        sixFrameResult1.text = "-"
                        total += 20 + firstRand
                        fourFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        sixFrameResult1.text = "X"
                    }else {
                        total += 20 + firstRand
                        fourFrameTotal.text = String(total)
                        sixFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount > 2){
                    total += 30
                    fourFrameTotal.text = String(total)
                    sixFrameResult1.text = "X"
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            fiveFrameTotal.text = String(total)
                        }
                        
                        sixFrameResult1.text = "-"
                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            fiveFrameTotal.text = String(total)
                        }
                        
                        sixFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 7){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        sevenFrameResult1.text = "-"
                        sixFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            sixFrameTotal.text = String(total)
                        }
                        
                        sevenFrameResult1.text = "X"
                    }else {
                        total += 10 + firstRand
                        sixFrameTotal.text = String(total)
                        sevenFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount == 2){
                    if(firstRand == 0){
                        sevenFrameResult1.text = "-"
                        total += 20 + firstRand
                        fiveFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            sixFrameTotal.text = String(total)
                        }
                        sevenFrameResult1.text = "X"
                    }else {
                        total += 20 + firstRand
                        fiveFrameTotal.text = String(total)
                        sevenFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount > 2){
                    total += 30
                    fiveFrameTotal.text = String(total)
                    sevenFrameResult1.text = "X"
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            sixFrameTotal.text = String(total)
                        }
                        sevenFrameResult1.text = "-"
                    }else {
                        
                        if(spare == true){
                            total += 10 + firstRand
                            
                            sixFrameTotal.text = String(total)
                        }
                        sevenFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 8){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        eightFrameResult1.text = "-"
                        sevenFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            sevenFrameTotal.text = String(total)
                        }
                        eightFrameResult1.text = "X"
                    }else {
                        total += 10 + firstRand
                        sevenFrameTotal.text = String(total)
                        eightFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount == 2){
                    if(firstRand == 0){
                        eightFrameResult1.text = "-"
                        total += 20 + firstRand
                        sixFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        eightFrameResult1.text = "X"
                    }else {
                        total += 20 + firstRand
                        sixFrameTotal.text = String(total)
                        eightFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount > 2){
                    total += 30
                    sixFrameTotal.text = String(total)
                    eightFrameResult1.text = "X"
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            sevenFrameTotal.text = String(total)
                        }
                        
                        eightFrameResult1.text = "-"

                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            sevenFrameTotal.text = String(total)
                        }
                        
                        eightFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 9){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        nineFrameResult1.text = "-"
                        eightFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        if(spare == true){
                            total += 20
                            eightFrameTotal.text = String(total)
                        }
                        nineFrameResult1.text = "X"
                    }else {
                        total += 10 + firstRand
                        eightFrameTotal.text = String(total)
                        nineFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount == 2){
                    if(firstRand == 0){
                        nineFrameResult1.text = "-"
                        total += 20 + firstRand
                        sevenFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        nineFrameResult1.text = "X"
                    }else {
                        total += 20 + firstRand
                        sevenFrameTotal.text = String(total)
                        nineFrameResult1.text = String(firstRand)
                    }
                }else if(continuousStrikeCount > 2){
                    total += 30
                    sevenFrameTotal.text = String(total)
                    nineFrameResult1.text = "X"
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            eightFrameTotal.text = String(total)
                        }
                        
                        nineFrameResult1.text = "-"
                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            eightFrameTotal.text = String(total)
                        }
                        
                        nineFrameResult1.text = String(firstRand)
                    }
                }
            }else if(frame == 10){
                if(continuousStrikeCount == 1){
                    if(firstRand == 0){
                        tenFrameResult1.text = "-"
                        nineFrameTotal.text = String(total)
                    }else if(firstRand == 10){
                        tenFrameResult1.text = "X"
                        gameCount += 1
                    }else {
                        total += 10 + firstRand
                        nineFrameTotal.text = String(total)
                        tenFrameResult1.text = String(firstRand)
                    }
                }else {
                    if(firstRand == 0){
                        if(spare == true){
                            total += 10
                            
                            nineFrameTotal.text = String(total)
                        }
                        
                        tenFrameResult1.text = "-"
                    }else if(firstRand == 10){
                        tenFrameResult1.text = "X"
                        gameCount += 1
                    }else {
                        if(spare == true){
                            total += 10 + firstRand
                            
                            nineFrameTotal.text = String(total)
                        }
                        
                        tenFrameResult1.text = String(firstRand)
                    }
                }
            }
            if(firstRand != 10){
                print(gameCount)
                gameCount += 1
            }
        }
        
        //second game
        else if(gameCount == 2){
            
            secondRand = Int(arc4random_uniform(UInt32(11 - firstRand)))
            print("chk")
            if(frame == 1){
                if(secondRand == 0){
                    oneFrameResult2.text = "-"
                    total += firstRand
                    
                    oneFrameTotal.text = String(total)
                }else if(firstRand + secondRand == 10){
                    oneFrameResult2.text = "/"
                }else {
                    oneFrameResult2.text = String(secondRand)
                    
                    total += firstRand + secondRand
                    oneFrameTotal.text = String(total)
                }
    
            }else if(frame == 2){
                
                if(continuousStrikeCount == 1){
                    if(secondRand == 0){
                        twoFrameResult2.text = "-"
                        total += 10 + firstRand
                        
                        oneFrameTotal.text = String(total)
                        total += firstRand
                        
                        twoFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        twoFrameResult2.text = "/"
                        total += 10 + firstRand + secondRand
                        
                        oneFrameTotal.text = String(total)
                        
                        total += firstRand + secondRand
                        
                        twoFrameTotal.text = String(total)
                    }else{
                        total += 10 + firstRand + secondRand
                        oneFrameTotal.text = String(total)
                        twoFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        twoFrameTotal.text = String(total)
                    }
                }else {
                    if(secondRand == 0){
                        twoFrameResult2.text = "-"
                        total += firstRand

                        twoFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        twoFrameResult2.text = "/"
                        total += firstRand + secondRand
  
                        total += firstRand + secondRand

                    }else {
                        twoFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        twoFrameTotal.text = String(total)
                    }
                }
                
            }else if(frame == 3){
                print("game2")
                print(continuousStrikeCount)
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        threeFrameResult2.text = "-"
                        twoFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        print("chk")
                        threeFrameResult2.text = "/"
                        twoFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        total += 10 + secondRand
                        threeFrameResult2.text = String(secondRand)
                        twoFrameTotal.text = String(total)
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        threeFrameResult2.text = "-"
                        total += 10 + secondRand
                        twoFrameTotal.text = String(total)
                        threeFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        threeFrameResult2.text = "/"
                        total += 20
                        twoFrameTotal.text = String(total)
                        frame += 1
                       
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        twoFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        threeFrameTotal.text = String(total)
                        threeFrameResult2.text = String(secondRand)
                    }
                }else {
                    if(secondRand == 0){
                        threeFrameResult2.text = "-"
                        total += firstRand
                        threeFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        threeFrameResult2.text = "/"
                        
                    }else {
                        threeFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        threeFrameTotal.text = String(total)
                    }
                }
            }else if(frame == 4){
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        fourFrameResult2.text = "-"
                        threeFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        fourFrameResult2.text = "/"
                        threeFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        total += 10 + secondRand
                        fourFrameResult2.text = String(secondRand)
                        threeFrameTotal.text = String(total)
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        fourFrameResult2.text = "-"
                        total += 10 + secondRand
                        threeFrameTotal.text = String(total)
                        fourFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        fourFrameResult2.text = "/"
                        total += 20
                        threeFrameTotal.text = String(total)
                        frame += 1
                       
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        threeFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        fourFrameTotal.text = String(total)
                        fourFrameResult2.text = String(secondRand)
                    }
                }else {
                    if(secondRand == 0){
                        fourFrameResult2.text = "-"
                        total += firstRand
                        fourFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        fourFrameResult2.text = "/"
                        
                    }else {
                        fourFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        fourFrameTotal.text = String(total)
                    }
                }
            }else if(frame == 5){
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        fiveFrameResult2.text = "-"
                        fourFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        fiveFrameResult2.text = "/"
                        fourFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        total += 10 + secondRand
                        fiveFrameResult2.text = String(secondRand)
                        fourFrameTotal.text = String(total)
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        fiveFrameResult2.text = "-"
                        total += 10 + secondRand
                        fourFrameTotal.text = String(total)
                        fiveFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        fiveFrameResult2.text = "/"
                        total += 20
                        fourFrameTotal.text = String(total)
                        frame += 1
                        
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        fourFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        fiveFrameTotal.text = String(total)
                        fiveFrameResult2.text = String(secondRand)
                    }
                }else {
                    if(secondRand == 0){
                        fiveFrameResult2.text = "-"
                        total += firstRand
                        fiveFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        fiveFrameResult2.text = "/"
                        
                    }else {
                        fiveFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        fiveFrameTotal.text = String(total)
                    }
                }
            }else if(frame == 6){
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        sixFrameResult2.text = "-"
                        fiveFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        sixFrameResult2.text = "/"
                        fiveFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        total += 10 + secondRand
                        sixFrameResult2.text = String(secondRand)
                        fiveFrameTotal.text = String(total)
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        sixFrameResult2.text = "-"
                        total += 10 + secondRand
                        fiveFrameTotal.text = String(total)
                        sixFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        fiveFrameResult2.text = "/"
                        total += 20
                        sixFrameTotal.text = String(total)
                        frame += 1
                        
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        fiveFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        sixFrameTotal.text = String(total)
                        sixFrameResult2.text = String(secondRand)
                    }
                }else {
                    if(secondRand == 0){
                        sixFrameResult2.text = "-"
                        total += firstRand
                        sixFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        sixFrameResult2.text = "/"
                   
                    }else {
                        sixFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        sixFrameTotal.text = String(total)
                    }
                }
            }else if(frame == 7){
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        sevenFrameResult2.text = "-"
                        sixFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        sevenFrameResult2.text = "/"
                        sixFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        total += 10 + secondRand
                        sevenFrameResult2.text = String(secondRand)
                        sixFrameTotal.text = String(total)
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        sevenFrameResult2.text = "-"
                        total += 10 + secondRand
                        sixFrameTotal.text = String(total)
                        sevenFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        sevenFrameResult2.text = "/"
                        total += 20
                        sixFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        sixFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        sevenFrameTotal.text = String(total)
                        sevenFrameResult2.text = String(secondRand)
                    }
                }else {
                    if(secondRand == 0){
                        sevenFrameResult2.text = "-"
                        total += firstRand
                        sevenFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        sevenFrameResult2.text = "/"
                    }else {
                        sevenFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        sevenFrameTotal.text = String(total)
                    }
                }
            }else if(frame == 8){
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        eightFrameResult2.text = "-"
                        sevenFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        eightFrameResult2.text = "/"
                        sevenFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        total += 10 + secondRand
                        eightFrameResult2.text = String(secondRand)
                        sevenFrameTotal.text = String(total)
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        eightFrameResult2.text = "-"
                        total += 10 + secondRand
                        sevenFrameTotal.text = String(total)
                        eightFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        eightFrameResult2.text = "/"
                        total += 20
                        sevenFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        sevenFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        eightFrameTotal.text = String(total)
                        eightFrameResult2.text = String(secondRand)
                    }
                }else {
                    if(secondRand == 0){
                        eightFrameResult2.text = "-"
                        total += firstRand
                        eightFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        eightFrameResult2.text = "/"
                    }else {
                        eightFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        eightFrameTotal.text = String(total)
                    }
                }
            }else if(frame == 9){
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        nineFrameResult2.text = "-"
                        eightFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        nineFrameResult2.text = "/"
                        eightFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        total += 10 + secondRand
                        nineFrameResult2.text = String(secondRand)
                        eightFrameTotal.text = String(total)
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        eightFrameResult2.text = "-"
                        total += 10 + secondRand
                        nineFrameTotal.text = String(total)
                        eightFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        nineFrameResult2.text = "/"
                        total += 20
                        eightFrameTotal.text = String(total)
                        frame += 1
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        eightFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        nineFrameTotal.text = String(total)
                        nineFrameResult2.text = String(secondRand)
                    }
                }else {
                    if(secondRand == 0){
                        nineFrameResult2.text = "-"
                        total += firstRand
                        nineFrameTotal.text = String(total)
                    }else if(firstRand + secondRand == 10){
                        nineFrameResult2.text = "/"
                    }else {
                        nineFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        nineFrameTotal.text = String(total)
                    }
                }
            }else if(frame == 10){
                if(continuousStrikeCount == 1){
                   
                    if(secondRand == 0){
                        tenFrameResult2.text = "-"
                        nineFrameTotal.text = String(total)
                        
                        strikeBtn.isHidden = true
                        randomBtn.isHidden = true
                        gameoverLabel.isHidden = false
                    }else if(firstRand + secondRand == 10){
                        tenFrameResult2.text = "/"
                        gameCount += 1
                    }else {
                        total += 10 + secondRand
                        tenFrameResult2.text = String(secondRand)
                        nineFrameTotal.text = String(total)
                        
                        strikeBtn.isHidden = true
                        randomBtn.isHidden = true
                        gameoverLabel.isHidden = false
                    }
                }else if(continuousStrikeCount == 2){
                    
                    if(secondRand == 0){
                        tenFrameResult2.text = "-"
                        total += 10 + secondRand
                        nineFrameTotal.text = String(total)
                        tenFrameTotal.text = String(total)
                        
                        strikeBtn.isHidden = true
                        randomBtn.isHidden = true
                        gameoverLabel.isHidden = false
                    }else if(firstRand + secondRand == 10){
                        tenFrameResult2.text = "/"
                        total += 20
                        tenFrameTotal.text = String(total)
                        gameCount += 1
                    }else {
                        print(total)
                        total += 10 + firstRand + secondRand
                        twoFrameTotal.text = String(total)
                        total += firstRand + secondRand
                        threeFrameTotal.text = String(total)
                        threeFrameResult2.text = String(secondRand)
                        
                        strikeBtn.isHidden = true
                        randomBtn.isHidden = true
                        gameoverLabel.isHidden = false
                    }
                }else {
                    if(secondRand == 0){
                        tenFrameResult2.text = "-"
                        total += firstRand
                        tenFrameTotal.text = String(total)
                        
                        strikeBtn.isHidden = true
                        randomBtn.isHidden = true
                        gameoverLabel.isHidden = false
                    }else if(firstRand + secondRand == 10){
                        tenFrameResult2.text = "/"
                        gameCount += 1
                    }else {
                        tenFrameResult2.text = String(secondRand)
                        
                        total += firstRand + secondRand
                        
                        tenFrameTotal.text = String(total)
                        
                        strikeBtn.isHidden = true
                        randomBtn.isHidden = true
                        gameoverLabel.isHidden = false
                    }
                }
            }
            continuousStrikeCount = 0
            
            if (frame != 10){
                frame += 1
                gameCount = 1
            }
        }else if(gameCount == 3){
            print("g3")
            let thirdRand = Int(arc4random_uniform(10)+1)
            
            if(thirdRand == 0){
                tenFrameResult3.text = "-"
                total += firstRand + secondRand
                tenFrameTotal.text = String(total)
            }else if(thirdRand == 10){
                tenFrameResult3.text = "X"
                total += firstRand + secondRand + thirdRand
                tenFrameTotal.text = String(total)
            }else {
                total += firstRand + secondRand + thirdRand
                tenFrameTotal.text = String(total)
            }
            
            strikeBtn.isHidden = true
            randomBtn.isHidden = true
            gameoverLabel.isHidden = false
        }
        spare = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //nickname set
        player1Label.text = player1
        
        gameoverLabel.isHidden = true
    }
}
 
