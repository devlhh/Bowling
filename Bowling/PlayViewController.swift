//
//  PlayViewController.swift
//  Bowling
//
//  Created by DM on 2021/05/25.
//

import UIKit
import QuartzCore

class Person {
    var nickname: String = ""
    
    var score1 : [Int] = [0,0,0,0,0,0,0,0,0,0]
    var score2 : [Int] = [0,0,0,0,0,0,0,0,0,0]
    var score3 : Int = 0
    
    var score1Label : [UILabel] = []
    var score2Label : [UILabel] = []
    var score3Label : UILabel!
    
    var totalLabel : [UILabel] = []
    var total : [Int] = [0,0,0,0,0,0,0,0,0,0]
    
    var continuousStrike : Int = 0
    var prevSpare = false
    
    var pframe : Int = 1
    
    init(nickname: String) {
        self.nickname = nickname
    }
}

class PlayViewController : UIViewController, UITextFieldDelegate {
    var player : [String] = []
    var person : [Person] = []
    
    var frameNumberLabel : [UILabel] = []

    var gameCount  : Int = 1
    var playerCount : Int = 0
    
    var firstRand : Int = 0
    var secondRand : Int = 0
    var frame : Int = 1
    var index = 0;
    
    var turnLabel : [UILabel] = []
    
    var strikeLabel1 : UILabel!
    var strikeLabel2 : UILabel!
    var spareLabel1 : UILabel!
    var spareLabel2 : UILabel!
    var strikeImage1: UIImageView!
    var spareImage1: UIImageView!
    var strikeImage2: UIImageView!
    var spareImage2: UIImageView!
    
    @IBOutlet var strikeBtn: UIButton!
    @IBOutlet var randomBtn: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    
    //스트라이크 image 애니메이션
    func strikeImageAnimate1() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.strikeImage1.alpha = 1.0
            self.strikeImage1.alpha = 0.0
        },completion: nil)
    }
    
    //스트라이크 image 애니메이션
    func strikeImageAnimate2() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.strikeImage2.alpha = 1.0
            self.strikeImage2.alpha = 0.0
        },completion: nil)
    }
    
    //스트라이크 image 애니메이션
    func spareImageAnimate1() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.spareImage1.alpha = 1.0
            self.spareImage1.alpha = 0.0
        },completion: nil)
    }
    
    //스트라이크 image 애니메이션
    func spareImageAnimate2() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.spareImage2.alpha = 1.0
            self.spareImage2.alpha = 0.0
        },completion: nil)
    }

    //스트라이크 글자 애니메이션
    func strikeAnimate1() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.strikeLabel1.alpha = 1.0
            self.strikeLabel1.alpha = 0.0
        },completion: nil)
    }
    
    //스페어 글자 애니메이션
    func spareAnimate1() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.spareLabel1.alpha = 1.0
            self.spareLabel1.alpha = 0.0
        },completion: nil)
    }
    
    //스트라이크 글자 애니메이션
    func strikeAnimate2() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.strikeLabel2.alpha = 1.0
            self.strikeLabel2.alpha = 0.0
        },completion: nil)
    }
    
    //스페어 글자 애니메이션
    func spareAnimate2() {
        UIView.animate(withDuration: 3.0, delay:0.0 ,animations: {
            self.spareLabel2.alpha = 1.0
            self.spareLabel2.alpha = 0.0
        },completion: nil)
    }
    
    //스크롤 밑으로
    func scrollbottom() {
        UIView.animate(withDuration: 1.0, delay:1.0 ,animations: {
            self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 500.0), animated: false)
        },completion: nil)
    }
    
    //스크롤 위로
    func scrolltop() {
        UIView.animate(withDuration: 1.0, delay:1.0 ,animations: {
            self.scrollView.setContentOffset(CGPoint(x: 0.0, y:-91.0), animated: false)
        },completion: nil)
    }
    
    //1턴 알려주는 애니메이션
    func animate1() {
        UIView.animate(withDuration: 1, delay:1.0, options:[.repeat, .autoreverse] ,animations: {
            self.turnLabel[0].alpha = 1.0
            self.turnLabel[0].alpha = 0.0
        },completion: nil)
    }
		
    //2턴 알려주는 애니메이션
    func animate2() {
        UIView.animate(withDuration: 1, delay:1.0, options:[.repeat, .autoreverse] ,animations: {
            self.turnLabel[1].alpha = 1.0
            self.turnLabel[1].alpha = 0.0
        },completion: nil)
    }
    
    //3턴 알려주는 애니메이션
    func animate3() {
        UIView.animate(withDuration: 1, delay:1.0, options:[.repeat, .autoreverse] ,animations: {
            self.turnLabel[2].alpha = 1.0
            self.turnLabel[2].alpha = 0.0
        },completion: nil)
    }
    
    //4턴 알려주는 애니메이션
    func animate4() {
        UIView.animate(withDuration: 1, delay:1.0, options:[.repeat, .autoreverse] ,animations: {
            self.turnLabel[3].alpha = 1.0
            self.turnLabel[3].alpha = 0.0
        },completion: nil)
    }
    
    //스트라이크 관련 함수
    func strike() {
        print("")
        print("Strike Func()")
        print("Frame --> \(person[playerCount].pframe)")
       
        if(playerCount < 2){
            strikeAnimate1()
            strikeImageAnimate1()
        }else{
            strikeAnimate2()
            strikeImageAnimate2()
        }
        
        //첫번째 게임
        if(gameCount == 1){
            print("GameCount -> 1")
            print(playerCount)
            
            //연속스트라이크 개수 Add
            person[playerCount].continuousStrike += 1
            
            print("ContinuousStrike --> \(person[playerCount].continuousStrike)")
            
            //1Frame
            if(person[playerCount].pframe == 1){
                print("1Frame In")
                //스트라이크 표시
                person[playerCount].score1Label[frame].text = "X"
                
                //첫번째 프레임 첫번째 결과 총합
                person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score1[frame]
               
                //현재 플레이어 게임 프레임 증가
                person[playerCount].pframe += 1
                gameCount = 1
                
                if(playerCount < player.count - 1){
                    playerCount += 1
                }else {
                    playerCount = 0
                }
                print("")
            }	
            //2Frame ~ 9Frame
            else if(person[playerCount].pframe < 10){
                print("2-9Frame In")
                
                //스트라이크 표시
                person[playerCount].score1Label[frame].text = "X"
                
                //스페어 계산
                if(person[playerCount].prevSpare == true){
                    person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                    person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                }
                
                //스트라이크 1개
                if(person[playerCount].continuousStrike == 1){
                    print("Strike 1")
                    
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                    print("현재 총점 --> \(person[playerCount].total[frame])")
                }
                //연속 스트라이크 2개
                else if(person[playerCount].continuousStrike == 2){
                    print("Strike 2")
                    
                    //첫번째 스트라이크에 대한 총점 (첫번째 보너스 점수
                    person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                    print("첫번째 스트라이크 보너스점수1 총점 -> \(person[playerCount].total[frame - 1])")
                    
                    //현재 스트라이크에 대한 총점
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                    print("현재 총점 -> \(person[playerCount].total[frame])")
                }
                //스트라이크 3개이상
                else if(person[playerCount].continuousStrike > 2){
                    print("Strike 3.....")
                    
                    //첫번째 스트라이크 두번쩨 보너스 점수
                    person[playerCount].total[frame - 2] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame]
                    person[playerCount].totalLabel[frame - 2].text = String(person[playerCount].total[frame - 2])
                    print("첫번째 스트라이크에 대한 보너스점수2 총점 -> \(person[playerCount].total[frame - 2])")
                    
                    //두번째 스트라이크에 대한 첫번째 보너스 점수
                    person[playerCount].total[frame - 1] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame - 1] + person[playerCount].score1[frame]
                    print("두번째 스트라이크에 대한 보너스점수1 총점 -> \(person[playerCount].total[frame - 1])")
                    
                    //세번째 스트라이크 총점
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].total[frame]
                    print("세번째 스트라이크에 대한 총점 -> \(person[playerCount].total[frame - 1])")
                }
  
                //현재 플레이어 게임 프레임 증가
                person[playerCount].pframe += 1
                gameCount = 1
                
                //스페어 해제
                person[playerCount].prevSpare = false
                
                if(playerCount < player.count - 1){
                    playerCount += 1
                }else {
                    playerCount = 0
                }
                print("")
            }
            //10Frame
            else {
                print("10Frame In")
                //스트라이크 표시
                person[playerCount].score1Label[frame].text = "X"
                
                //스트라이크 한개
                if(person[playerCount].continuousStrike == 1){
                    print("Strike 1")
                    print(person[playerCount].total[frame - 1])
                    
                    //이전 스페어
                    if(person[playerCount].prevSpare == true){
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                        print("9Frame 총점 -> \(person[playerCount].total[frame - 1])")
                    }
                    
                    //10Frame 총점
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                    print("10Frame 총점 -> \(person[playerCount].total[frame])")
                }
                
                //연속 스트라이크 2개
                else if(person[playerCount].continuousStrike == 2){
                    print("Strike 2")
                    
                    //첫번째 스트라이크에 대한 총점 (첫번째 보너스 점수
                    person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                    print("첫번째 스트라이크 보너스점수1 총점 -> \(person[playerCount].total[frame - 1])")
                    
                    //현재 스트라이크에 대한 총점
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                    print("현재 총점 -> \(person[playerCount].total[frame])")
                }
                //스트라이크 3개이상
                else if(person[playerCount].continuousStrike > 2){
                    print("Strike 3.....")
                    
                    //첫번째 스트라이크 두번쩨 보너스 점수
                    person[playerCount].total[frame - 2] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame]
                    person[playerCount].totalLabel[frame - 2].text = String(person[playerCount].total[frame - 2])
                    print("첫번째 스트라이크에 대한 보너스점수2 총점 -> \(person[playerCount].total[frame - 2])")
                    
                    //두번째 스트라이크에 대한 첫번째 보너스 점수
                    person[playerCount].total[frame - 1] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame - 1] + person[playerCount].score1[frame]
                    print("두번째 스트라이크에 대한 보너스점수1 총점 -> \(person[playerCount].total[frame - 1])")
                    
                    //세번째 스트라이크 총점
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].total[frame]
                    print("세번째 스트라이크에 대한 총점 -> \(person[playerCount].total[frame - 1])")
                }
                
                //다음 플레이어
                gameCount += 1
                person[playerCount].prevSpare = false
                print("")
            }
            if(playerCount == 0){
                if(player.count - 1 == 0){
                    turnLabel[0].layer.removeAllAnimations()
                }else {
                    turnLabel[player.count - 1].layer.removeAllAnimations()
                }
                scrolltop()
                animate1()
            }else if(playerCount == 1){
                turnLabel[0].layer.removeAllAnimations()
                animate2()
                
            }else if(playerCount == 2){
                turnLabel[1].layer.removeAllAnimations()
                scrollbottom()
                animate3()
            }else {
                turnLabel[2].layer.removeAllAnimations()
                animate4()
            }
        }
        //2번째 게임
        //10Frame에만 카운트2로 옴.
        else if(gameCount == 2){
            print("")
            print("Strike Func GameCount -> 2")
            
            //연속스트라이크 개수 Add
            person[playerCount].continuousStrike += 1
            
            person[playerCount].score2Label[frame].text = "X"
            
            if(person[playerCount].continuousStrike == 2){
                print("Strike 2")
                
                //10Frame 2번째결과 더해줌
                person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score2[frame]
                print("10Frame 총점 -> \(person[playerCount].total[frame])")
            }
            
            if(person[playerCount].continuousStrike > 2){
                print("Strike 3....")
                
                //9Frame 두번째 보너스점수
                person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1]  + person[playerCount].score2[frame]
                
                //9Frame 결과
                person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                print("9Frame총점 --> \(person[playerCount].total[frame - 1])")
                
                //10Frame 총점
                person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                print("10Frame총점 --> \(person[playerCount].total[frame])")
            }
            //스페어 해제
            person[playerCount].prevSpare = false
            gameCount += 1
        }
        //3번째 게임
        else if(gameCount == 3){
            print("Strike Func GameCount -> 3")

            //10Frame 총점
            person[playerCount].score3Label.text = "X"
            person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score3
            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
            print("10Frame 총점 --> \(person[playerCount].total[frame])")
            
            //스페어 해제
            person[playerCount].prevSpare = false
            
            if(playerCount < player.count - 1){
                playerCount += 1
                gameCount = 1
            }else {
                playerCount = 0
                strikeBtn.isHidden = true
                randomBtn.isHidden = true
            }
        }
        else{
            print("GameCount 초과")
        }
    }
    
    func spare() {
        print("")
        print("Spare Func()")
        
        if(playerCount < 2){
            spareAnimate1()
            spareImageAnimate1()
        }else {
            spareAnimate2()
            spareImageAnimate2()
        }
        
        //스페어 true로 변경
        person[playerCount].prevSpare = true
        
        //스페어 표시
        person[playerCount].score2Label[frame].text = "/"
        
        //현재 프레임 총점
        person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score2[frame]
        print("총점 -> \(person[playerCount].total[frame])")
        
        //2~9Frame
        if(person[playerCount].pframe < 10){
            print("10Frame 전")
            
            //스트라이크 1개
            if(person[playerCount].continuousStrike == 1){
                print("Strike 1")
                
                //첫번째 스트라이크에 대한 2번째 보너스점수
                person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                print("이전프레임 총점 --> \(person[playerCount].total[frame - 1])")
                
                person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                print("현재 총점 --> \(person[playerCount].total[frame])")
                
                //첫번째 스트라이크 점수표시.
                person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
            }
            //연속 스트라이크 2개
            else if(person[playerCount].continuousStrike == 2){
                print("Strike 2")
                
                //두번째 스트라이크에 대한 두번째 보너스 점수
                person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                print("두번째 스트라이크 총점 -> \(person[playerCount].total[frame - 1])")
                
                //현재 프레임 총점
                person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                print("현재 프레임 총점 -> \(person[playerCount].total[frame])")
                                        
                //두번째 스트라이크 총점 표시
                person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])

            }
            //스트라이크 3개이상
            else if(person[playerCount].continuousStrike > 2){
                print("Strike 3.....")
                
                //이전프레임 스트라이크 두번째 보너스 점수
                person[playerCount].total[frame - 1] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                print("이전프레임 총점-> \(person[playerCount].total[frame - 1])")
                
                //이전프레임 총점 표시
                person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                
                //현재 프레임 총점
                person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
            }
           
            gameCount = 1
            person[playerCount].pframe += 1
            
            //연속 스트라이크 초기화
            person[playerCount].continuousStrike = 0
            print("continuousStrike -> \(person[playerCount].continuousStrike)")
            
            if(playerCount < player.count - 1){
                print("Spare playerCount increase")
                playerCount += 1
            }else {
                print("Spare playerCount 0")
                playerCount = 0
            }
        }
        //10Frame
        else if(person[playerCount].pframe == 10){
            print("Spare 10Frame In")
            
            if(gameCount == 2){
                print("Spare Func GameCount 2")
                
                //스트라이크 한개
                if(person[playerCount].continuousStrike == 1){
                    //9Frame
                    person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1 ] + person[playerCount].score2[frame]
                    print("9Frame 총점 -> \(person[playerCount].total[frame - 1])")
                    
                    //10Frame
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                    print("10Frame 총점 -> \(person[playerCount].total[frame])")
                    
                    //9Frame 표시
                    person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                }
                //스트라이크 3개이상
                else if(person[playerCount].continuousStrike > 2){
                    print("Strike 3.....")
                    
                    //두번째 스트라이크에 대한 첫번째 보너스 점수
                    person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                    print("9Frame 총점 -> \(person[playerCount].total[frame - 1])")
                    
                    //세번째 스트라이크 총점
                    person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                    print("현재 총점 -> \(person[playerCount].total[frame])")
                    
                    person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                }
            }
            else if(gameCount == 3){
                print("Spare Func GameCount3")
            }
            person[playerCount].continuousStrike = 0
        }
        if(playerCount == 0){
            if(player.count - 1 == 0){
                turnLabel[0].layer.removeAllAnimations()
            }else {
                turnLabel[player.count - 1].layer.removeAllAnimations()
            }
            scrolltop()
            animate1()
        }else if(playerCount == 1){
            turnLabel[0].layer.removeAllAnimations()
            animate2()
            
        }else if(playerCount == 2){
            turnLabel[1].layer.removeAllAnimations()
            scrollbottom()
            animate3()
        }else {
            turnLabel[2].layer.removeAllAnimations()
            animate4()
        }
    }
    
    @IBAction func strikeBtnClicked(_ sender: UIButton) {
        print("")
        print("Strike Button Clicked")
        frame = person[playerCount].pframe - 1
 
        //첫번째 게임
        //gameCount1이면 무조건 스트라이크
        if(gameCount == 1){
            print("GameCount -> 1")
            
            //10점
            person[playerCount].score1[frame] = 10
            strike()
        }
        //두번째 게임
        else if(gameCount == 2){
            print("StrikeBtn GameCount -> 2")
            
            //1~9Frame
            if(person[playerCount].pframe < 10){
                //첫번째 결과가 아니면 스페어처리
                if(person[playerCount].score1[frame] != 10){
                    print("Sapre!!")
                    person[playerCount].score2[frame] = 10 - person[playerCount].score1[frame]
                    spare()
                }
                else {
                    print("Strike!!")
                    person[playerCount].score2[frame] = 10
                    strike()
                    print("gameCount -> \(gameCount)")
                }
            }
            //10Frame
            else{
                //첫번째 결과가 아니면 스페어처리
                if(person[playerCount].score1[frame] != 10){
                    print("Sapre!!")
                    person[playerCount].score2[frame] = 10 - person[playerCount].score1[frame]
                    spare()
                    gameCount += 1
                }
                else {
                    print("Strike!!")
                    person[playerCount].score2[frame] = 10
                    strike()
                }
            }
        }
        //세번째 게임
        else if(gameCount == 3){
            print("")
            print("GameCount -> 3")
   
            //첫번째,두번째 스트라이크
            if(person[playerCount].score1[frame] == 10 && person[playerCount].score2[frame] == 10){
                print("Strike!!")
                person[playerCount].score3 = 10
                strike()
            }else if(person[playerCount].prevSpare){
                person[playerCount].score3 = 10
                strike()
                print(gameCount)
            }
            //스페어
            else if(person[playerCount].score1[frame] == 10 && person[playerCount].prevSpare == false){
                print("Spare!!")
                person[playerCount].score3 = 10 - person[playerCount].score2[frame]
                
                person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score3
                person[playerCount].score3Label.text = "/"
                
                person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                
                if(playerCount < 2){
                    spareAnimate1()
                    scrolltop()
                }else {
                    spareAnimate2()
                    scrollbottom()
                }
    
                if(playerCount < player.count - 1){
                    print("player Next")
                    gameCount = 1
                    person[playerCount].continuousStrike = 0
                    playerCount += 1
                }
                //모든 플레이어 턴 종료
                else {
                    strikeBtn.isHidden = true
                    randomBtn.isHidden = true
                }
            }
            
        }else{
            print("GameCount 초과")
        }
    }
 
    @IBAction func randomBtnClicked(_ sender: UIButton) {
        print("")
        print("Random Button Clicked")
        print("\(person[playerCount].pframe)Frame In")
        print("PlayerCount --> \(playerCount)")

        //첫번째게임
        if(gameCount == 1){
            print("GameCount1 ")
            
            frame = person[playerCount].pframe - 1
            
            //첫번째 랜덤결과
            firstRand = Int(arc4random_uniform(11))
            person[playerCount].score1[frame] = firstRand
            print("첫번째 랜덤결과 --> \(firstRand)")
            
            //첫번째 프레임
            if(person[playerCount].pframe == 1){
                //스트라이크
                if(person[playerCount].score1[frame] == 10){
                    strike()
                }
                else {
                    //0개 일 때
                    if(person[playerCount].score1[frame] == 0){
                        //거터 표시
                        person[playerCount].score1Label[frame].text = "-"
                        print("현재 총점 -> \(person[playerCount].total[frame])")
                    }
                    //0개가 아닐 때
                    else {
                        //숫자 표시
                        person[playerCount].score1Label[frame].text = String(person[playerCount].score1[frame])
 
                        //첫번째 결과 총점더해줌
                        person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score1[frame]
                        print("현재 총점 -> \(person[playerCount].total[frame])")
                    }
                    gameCount += 1
                }
            }
            //2~9프레임
            else if(person[playerCount].pframe < 10){
                print("GameCount1 10Frame 전")
                
                //스트라이크
                if(person[playerCount].score1[frame] == 10){
                    print("Strike!!!")
                    strike()
                }
                else {
                    print(person[playerCount].prevSpare)
                    //이전 프레임 스페어이면 첫번째 결과 보너스점수.
                    if(person[playerCount].prevSpare == true){
                        print("Spare계산")
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        
                        //이전 프레임 총점 표시
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                    }
                    
                    //스트라이크 1개
                    if(person[playerCount].continuousStrike == 1){
                        print("Strike 1")
                        
                        //첫번째 스트라이크에 대한 첫번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("이전프레임 총점 --> \(person[playerCount].total[frame - 1])")
                        
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("현재 총점 --> \(person[playerCount].total[frame])")
                    }
                    //연속 스트라이크 2개
                    else if(person[playerCount].continuousStrike == 2){
                        print("Strike 2")
                        
                        //첫번째 스트라이크에 대한 두번째 보너스 점수
                        person[playerCount].total[frame - 2] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame]
                        print("첫번째 스트라이크 보너스점수2 총점 -> \(person[playerCount].total[frame - 2])")
                        person[playerCount].totalLabel[frame - 2].text = String(person[playerCount].total[frame - 2])
                        
                        //두번째 스트라이크에 대한 첫번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame - 1] + person[playerCount].score1[frame]
                        print("두번째 스트라이크 보너스점수1 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        //현재 스트라이크에 대한 총점
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("현재 총점 -> \(person[playerCount].total[frame])")
                    }
                    //스트라이크 3개이상
                    else if(person[playerCount].continuousStrike > 2){
                        print("Strike 3.....")
                        
                        //첫번째 스트라이크 두번쩨 보너스 점수
                        person[playerCount].total[frame - 2] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame]
                        person[playerCount].totalLabel[frame - 2].text = String(person[playerCount].total[frame - 2])
                        print("첫번째 스트라이크에 대한 보너스점수2 총점 -> \(person[playerCount].total[frame - 2])")
                        
                        //두번째 스트라이크에 대한 첫번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame - 1] + person[playerCount].score1[frame]
                        print("두번째 스트라이크에 대한 보너스점수1 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        //세번째 스트라이크 총점
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("현재 프레임 총점 -> \(person[playerCount].total[frame])")
                    }
                    
                    //0개 일 때
                    if(person[playerCount].score1[frame] == 0){
                        print("GameCount1 Gutter")
                        //거터 표시
                        person[playerCount].score1Label[frame].text = "-"
                        
                        if(person[playerCount].continuousStrike == 0){
                            //첫번째 결과 총점
                            person[playerCount].total[frame] = person[playerCount].total[frame - 1]
                            print("현재 총점 -> \(person[playerCount].total[frame])")
                        }
                    }
                    //0개가 아닐 때
                    else {
                        print("GameCount1 Not Gutter")
                        //숫자 표시
                        person[playerCount].score1Label[frame].text = String(person[playerCount].score1[frame])
                        //첫번째 결과 총점 더해줌
                        if(person[playerCount].continuousStrike == 0 ){
                            person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                            print("현재 총점 -> \(person[playerCount].total[frame])")
                        }
                    }
                    gameCount += 1
                }
            }
            
            //10프레임
            else if(person[playerCount].pframe == 10){
                
                //스트라이크
                if(person[playerCount].score1[frame] == 10){
                    strike()
                }
                else {
                    if(person[playerCount].prevSpare == true){
                        print("Spare계산")
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        
                        //이전 프레임 총점 표시
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                    }
                    
                    if(person[playerCount].continuousStrike == 1){
                        print("Strike 1")
                        
                        //9Frame 첫번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("9Frame 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        //10Frame 첫번째 결과 더해줌
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("10Frame 총점 -> \(person[playerCount].total[frame])")
                    }
                    else if(person[playerCount].continuousStrike == 2){
                        print("Strike 2")
                        
                        //8프레임 두번째 보너스 점수
                        person[playerCount].total[frame - 2] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame]
                        print("8Frame 총점 -> \(person[playerCount].total[frame - 2])")
                        
                        //9프레임 첫번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame - 1] + person[playerCount].score1[frame]
                        print("9Frame 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("10Frame 총점 -> \(person[playerCount].total[frame])")
                        
                        //8프레임 총점 표시
                        person[playerCount].totalLabel[frame - 2].text = String(person[playerCount].total[frame - 2])
                    }
                    
                    //스트라이크 3개이상
                    else if(person[playerCount].continuousStrike > 2){
                        print("Strike 3.....")
                        
                        //첫번째 스트라이크 두번쩨 보너스 점수
                        person[playerCount].total[frame - 2] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame]
                        person[playerCount].totalLabel[frame - 2].text = String(person[playerCount].total[frame - 2])
                        print("8Frame 총점 -> \(person[playerCount].total[frame - 2])")
                        
                        //두번째 스트라이크에 대한 첫번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 2] + person[playerCount].score1[frame - 1] + person[playerCount].score1[frame]
                        print("9Frame 대한 보너스점수1 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        //세번째 스트라이크 총점
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                        print("10Frame 대한 총점 -> \(person[playerCount].total[frame])")
                    }
                    
                    //0개 일 때
                    if(person[playerCount].score1[frame] == 0){
                        //거터 표시
                        person[playerCount].score1Label[frame].text = "-"
                       
                        if(person[playerCount].continuousStrike == 0){
                            //첫번째 결과 총점
                            person[playerCount].total[frame] = person[playerCount].total[frame - 1]
                            print("현재 총점 -> \(person[playerCount].total[frame])")
                        }
                       
                        gameCount += 1
                    }
                    //0개가 아닐 때
                    else {
                        //숫자 표시
                        person[playerCount].score1Label[frame].text = String(person[playerCount].score1[frame])
                        
                        if(person[playerCount].continuousStrike == 0){
                            //첫번째 결과 총점 더해줌
                            person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame]
                            print("현재 총점 -> \(person[playerCount].total[frame])")
                        }
                        
                        gameCount += 1
                    }
                }
            }
        }
        //두번째 게임
        else if(gameCount == 2){
            print("GameCount2 ")
        
            frame = person[playerCount].pframe - 1
            
            //2번째 랜덤 결과
            secondRand = Int(arc4random_uniform(UInt32(11 - firstRand)))
            person[playerCount].score2[frame] = secondRand
            print("Second Random Result --> \(person[playerCount].score2[frame])")
            
            //1프레임
            if(person[playerCount].pframe == 1){
                if(person[playerCount].score1[frame] + person[playerCount].score2[frame] == 10){
                    print("Spare!!!")
                    spare()
                }
                else{
                    print("No Spare!!!")
                    
                    if(person[playerCount].score2[frame] == 0){
                        //거터 표시
                        person[playerCount].score2Label[frame].text = "-"
                        
                        person[playerCount].total[frame] = person[playerCount].total[frame]
                        person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                        print("현재 총점 -> \(person[playerCount].total[frame])")
                        
                        //다음 게임으로
                        //게임카운트 초기화
                        person[playerCount].pframe += 1
                        gameCount = 1
                    }else {
                        //숫자 표시
                        person[playerCount].score2Label[frame].text = String(person[playerCount].score2[frame])
                        
                        person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score2[frame]
                        person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                        print("현재 총점 -> \(person[playerCount].total[frame])")
                        
                        //다음 게임으로
                        //게임 카운트 초기화
                        person[playerCount].pframe += 1
                        gameCount = 1
                    }
                    if(playerCount < player.count - 1){
                        print("player Next Turn")
                        playerCount += 1
                    }else {
                        print("player first")
                        playerCount = 0
                    }
                }
            }
            //2~9프레임
            else if(person[playerCount].pframe < 10){
                if(person[playerCount].score1[frame] + person[playerCount].score2[frame] == 10){
                    print("Spare!!!")
                    spare()
                }
                else{
                    print("No Spare!!!")

                    //스트라이크 1개
                    if(person[playerCount].continuousStrike == 1){
                        print("Strike 1")
                        
                        //첫번째 스트라이크에 대한 2번째 보너스점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                        print("이전프레임 총점 --> \(person[playerCount].total[frame - 1])")
                        
                       
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                        print("현재 총점 --> \(person[playerCount].total[frame])")
                        
                        //첫번째 스트라이크 점수표시.
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                        
                        if(person[playerCount].prevSpare == false){
                            //현재프레임 점수 표시
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                        }
                    }
                    //연속 스트라이크 2개
                    else if(person[playerCount].continuousStrike == 2){
                        print("Strike 2")
                        
                        //두번째 스트라이크에 대한 두번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                        print("두번째 스트라이크 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        //현재 프레임 총점
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                        print("현재 프레임 총점 -> \(person[playerCount].total[frame])")
                                                
                        //두번째 스트라이크 총점 표시
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                        
                        //현재 프레임 총점 표시
                        person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                    }
                    //스트라이크 3개이상
                    else if(person[playerCount].continuousStrike > 2){
                        print("Strike 3.....")
                        
                        //이전프레임 스트라이크에 대한 두번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                        print("이전 프레임 두번째 보너스 점수 -> \(person[playerCount].total[frame - 1])")
                        
                        //현재 프레임 총점
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                        print("현재 총점 -> \(person[playerCount].total[frame])")
                        
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                        person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                    }
                    
                    if(person[playerCount].score2[frame] == 0){
                        //거터 표시
                        person[playerCount].score2Label[frame].text = "-"
                        
                        if(person[playerCount].continuousStrike == 0){
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                            print("현재 거터 더한 총점 -> \(person[playerCount].total[frame])")
                        }
                        //다음 게임으로
                        //게임카운트 초기화
                        person[playerCount].prevSpare = false
                        person[playerCount].continuousStrike = 0
                        person[playerCount].pframe += 1
                        gameCount = 1
                    }
                    else {
                        //숫자 표시
                        person[playerCount].score2Label[frame].text = String(person[playerCount].score2[frame])
                        
                        
                        if(person[playerCount].continuousStrike == 0){
                            //현재 총점에 두번째 점수 더함
                            person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score2[frame]
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                            print("현재 숫자 더한 총점 -> \(person[playerCount].total[frame])")
                        }
                        
                        //다음 게임으로
                        //게임 카운트 초기화
                        //연속 스트라이크 초기화
                        person[playerCount].prevSpare = false
                        person[playerCount].continuousStrike = 0
                        person[playerCount].pframe += 1
                        gameCount = 1
                        
                        print("strike chk --> \(person[playerCount].continuousStrike)")
                    }
                    if(playerCount < player.count - 1){
                        print("player Next Turn")
                        playerCount += 1
                    }else {
                        print("player first")
                        playerCount = 0
                    }
                }
            }
            //10프레임
            else if(person[playerCount].pframe == 10){
                //스트라이크 처리
                if(person[playerCount].score1[frame] == 10 && person[playerCount].score2[frame] == 10){
                    print("Strike!!!")
                    strike()
                }
                //스페어 처리
                else if(person[playerCount].score1[frame] + person[playerCount].score2[frame] == 10 && person[playerCount].score1[frame] != 10){
                        print("10Frame Spare!!!")
                        spare()
                        gameCount += 1
                }
                else{
                    print("No Spare!!!")
                    
                    //스트라이크 1개
                    if(person[playerCount].continuousStrike == 1){
                        print("st 1")
                                                
                        if(person[playerCount].score1[frame - 1] == 10){
                            print("9 chk")
                            //9Frame 총점 표시
                            person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                            person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                        }
                        
                        //10Frame 2번째 결과 더해줌.
                        person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score2[frame]
                        print("10Frame 총점 -> \(person[playerCount].total[frame])")
                        
                        
                        if(person[playerCount].score1[frame] != 10){
                            
                            //10Frame 총점 표시
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                        }
                    }
                    //스트라이크 2개
                    else if(person[playerCount].continuousStrike == 2) {
                        print("Strike 2")
                        
                        //9Frame 두번째 보너스 점수
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                        print("9Frame 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        //10Frame 총점
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                        print("10Frame 총점 -> \(person[playerCount].total[frame])")
                        
                        //9Frame 총점 표시
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                        
                        if(person[playerCount].score1[frame] != 10){
                            //10Frame 총점 표시
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                        }
                    }
                    
                    //스트라이크 3개이상
                    else if(person[playerCount].continuousStrike > 2){
                        print("Strike 3.....")
                        
                        //9Frame 총점
                        person[playerCount].total[frame - 1] = person[playerCount].total[frame - 1] + person[playerCount].score2[frame]
                        print("9Frame 총점 -> \(person[playerCount].total[frame - 1])")
                        
                        //10Frame 총점
                        person[playerCount].total[frame] = person[playerCount].total[frame - 1] + person[playerCount].score1[frame] + person[playerCount].score2[frame]
                        print("현재 총점 -> \(person[playerCount].total[frame])")
                        
                        person[playerCount].totalLabel[frame - 1].text = String(person[playerCount].total[frame - 1])
                        
                        //10프레임 첫번째 결과 스트라이크일시 두번째 결과때 출력방지.
                        if(person[playerCount].score1[frame] != 10){
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                        }
                    }

                    person[playerCount].prevSpare = false
                    
                    if(person[playerCount].score2[frame] == 0){
                        //거터 표시
                        person[playerCount].score2Label[frame].text = "-"
                        
                        if(person[playerCount].continuousStrike == 0){
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                            print("현재 총점 -> \(person[playerCount].total[frame])")
                        }
                        
                    }else {
                        //숫자 표시
                        person[playerCount].score2Label[frame].text = String(person[playerCount].score2[frame])
                        
                        if(person[playerCount].continuousStrike == 0){
                            //현재 총점에 두번째 점수 더함
                            person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score2[frame]
                            person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                            print("현재 총점 -> \(person[playerCount].total[frame])")
                        }
                    }
                    if(person[playerCount].score1[frame] == 10){
                        gameCount += 1
                    }
                    //마지막 프레임 스트라이크 또는 스페어가아니면 게임종료.
                    else if(person[playerCount].prevSpare==false && person[playerCount].score1[frame] != 10){
                        if(playerCount < player.count - 1){
                            print("player Next")
                            gameCount = 1
                            person[playerCount].continuousStrike = 0
                            playerCount += 1
                        }
                        //모든 플레이어 턴 종료
                        else {
                            strikeBtn.isHidden = true
                            randomBtn.isHidden = true
                        }
                    }
                    else {
                        gameCount += 1
                    }
                }
            }
        }
        //세번째 게임
        else if(gameCount == 3){
            print("")
            print("GameCount3 ")
            
            if(person[playerCount].score1[frame] == 10 && person[playerCount].score2[frame] == 10){
                person[playerCount].score3 = Int(arc4random_uniform(11))
            }
            else if(person[playerCount].score1[frame] == 10){
                person[playerCount].score3 = Int(arc4random_uniform(UInt32(11 - person[playerCount].score2[frame])))
            }
            else {
                person[playerCount].score3 = Int(arc4random_uniform(11))
            }
            
            //스트라이크
            if(person[playerCount].score3 == 10 && person[playerCount].score1[frame] != 10){
                person[playerCount].score3Label.text = "X"
                person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score3
                person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
            }
            //스페어
            else if(person[playerCount].score2[frame] + person[playerCount].score3 == 10 && person[playerCount].score2[frame] != 10 && person[playerCount].prevSpare == false){
                print("Spare!!!")
                spare()
            }
            else{
                print("No Spare!!!")
                person[playerCount].prevSpare = false
                
                if(person[playerCount].score3 == 0){
                    //거터 표시
                    person[playerCount].score3Label.text = "-"
                    
                    person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                    print("현재 총점 -> \(person[playerCount].total[frame])")
                    
                    //다음 게임으로
                    gameCount = 1
                    person[playerCount].continuousStrike = 0
                    person[playerCount].pframe = 0
                }else {
                    //숫자 표시
                    person[playerCount].score3Label.text = String(person[playerCount].score3)
                    
                    //현재 총점에 세번째 점수 더함
                    person[playerCount].total[frame] = person[playerCount].total[frame] + person[playerCount].score3
                    person[playerCount].totalLabel[frame].text = String(person[playerCount].total[frame])
                    print("현재 총점 -> \(person[playerCount].total[frame])")
                    
                    //다음 게임으로
                    gameCount = 1
                    person[playerCount].continuousStrike = 0
                    person[playerCount].pframe = 0
                }
            }
            //다음 플레이어
            if(playerCount < player.count - 1){
                playerCount += 1
                gameCount = 1
            }else {
                strikeBtn.isHidden = true
                randomBtn.isHidden = true
            }
        }
        else {
            print("GameCount 초과")
        }
        if(playerCount == 0){
            if(player.count - 1 == 0){
                turnLabel[0].layer.removeAllAnimations()
            }else {
                turnLabel[player.count - 1].layer.removeAllAnimations()
            }
            scrolltop()
            animate1()
        }else if(playerCount == 1){
            turnLabel[0].layer.removeAllAnimations()
            animate2()
            
        }else if(playerCount == 2){
            turnLabel[1].layer.removeAllAnimations()
            scrollbottom()
            animate3()
        }else {
            turnLabel[2].layer.removeAllAnimations()
            animate4()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        btnCustom()
        
        for values in 0..<player.count {
            
            let nickname = player[values]
            person.append(Person(nickname: nickname))
          
            frameNumberLabelCreate()
            scoreLabelCreate()
            totalLabelCreate()
            playerLabelCreate()
            turnLabelCreate()
            startAnimate()
            
            index += 1
            playerCount += 1
        }
        strikeLabelCreate()
        spareLabelCreate()
        
        strikeLabel1.alpha = 0.0
        spareLabel1.alpha = 0.0
        strikeLabel2.alpha = 0.0
        spareLabel2.alpha = 0.0
        
        playerCount = 0
        //image.image = UIImage(named: "fire")
    }
    
    func strikeLabelCreate(){
        strikeLabel1 = UILabel()
        strikeLabel2 = UILabel()
        strikeImage1 = UIImageView()
        strikeImage2 = UIImageView()
        
        strikeLabel1.frame = CGRect(x:135, y: 520, width: 120, height: 20)
        strikeLabel1.text = "STRIKE !!!"
        strikeLabel1.textAlignment = .left
        strikeLabel1.textColor = .red
        strikeLabel1.alpha = 0.0
        strikeLabel1.font = UIFont.systemFont(ofSize: 28)
        
        strikeImage1.frame = CGRect(x:50, y: 200, width: 300, height: 300)
        strikeImage1.image = UIImage(named: "strike")
        strikeImage1.alpha = 0.0
        
        strikeLabel2.frame = CGRect(x:135, y: 1050, width: 120, height: 20)
        strikeLabel2.text = "STRIKE !!!"
        strikeLabel2.textAlignment = .center
        strikeLabel2.textColor = .red
        strikeLabel2.alpha = 0.0
        strikeLabel2.font = UIFont.systemFont(ofSize: 28)
        
        strikeImage2.frame = CGRect(x:50, y: 750, width: 300, height: 300)
        strikeImage2.image = UIImage(named: "strike")
        strikeImage2.alpha = 0.0
            
            
        scrollView.addSubview(strikeImage1)
        scrollView.addSubview(strikeLabel1)
        
        scrollView.addSubview(strikeImage2)
        scrollView.addSubview(strikeLabel2)
    }
    
    func spareLabelCreate(){
        spareLabel1 = UILabel()
        spareLabel2 = UILabel()
        spareImage1 = UIImageView()
        spareImage2 = UIImageView()
        
        spareLabel1.frame = CGRect(x:135, y: 520, width: 120, height: 20)
        spareLabel1.text = "SPARE !!!"
        spareLabel1.textAlignment = .left
        spareLabel1.textColor = .red
        spareLabel1.alpha = 0.0
        spareLabel1.font = UIFont.systemFont(ofSize: 28)  
        
        spareImage1.frame = CGRect(x:50, y: 200, width: 300, height: 300)
        spareImage1.image = UIImage(named: "spare")
        spareImage1.alpha = 0.0
        
        spareLabel2.frame = CGRect(x:135, y: 1050, width: 120, height: 20)
        spareLabel2.text = "SPARE !!!"
        spareLabel2.textAlignment = .center
        spareLabel2.textColor = .red
        spareLabel2.alpha = 0.0
        spareLabel2.font = UIFont.systemFont(ofSize: 28)
        
        spareImage2.frame = CGRect(x:50, y: 750, width: 300, height: 300)
        spareImage2.image = UIImage(named: "spare")
        spareImage2.alpha = 0.0
            
            
        scrollView.addSubview(spareLabel1)
        scrollView.addSubview(spareImage1)
        
        scrollView.addSubview(spareImage2)
        scrollView.addSubview(spareLabel2)
    }
    
    func startAnimate() {
        UIView.animate(withDuration: 1, delay:1.0, options:[.repeat, .autoreverse] ,animations: {
            self.turnLabel[0].alpha = 1.0
            self.turnLabel[0].alpha = 0.0
        },completion: nil)
    }
    
    func turnLabelCreate() {
        let label = UILabel()
        turnLabel.append(label)
        
        label.frame = CGRect(x:270, y: 66 + (index * 280), width: 120, height: 20)
        label.text = "<--------"
        label.textAlignment = .left
        label.textColor = .red
        label.alpha = 0.0
        label.font = UIFont.systemFont(ofSize: 24)
            
        scrollView.addSubview(turnLabel[index])
    }
    
    func btnCustom() {
        strikeBtn.layer.borderWidth = 2
        strikeBtn.layer.borderColor = UIColor.green.cgColor
        strikeBtn.layer.cornerRadius = 6.0
        
        randomBtn.layer.borderWidth = 2
        randomBtn.layer.borderColor = UIColor.green.cgColor
        randomBtn.layer.cornerRadius = 6.0
    }
 
    //플레이어 이름 레이블
    func playerLabelCreate() {
        let label = UILabel()
        label.frame = CGRect(x:20, y: 66 + (index * 280), width: 120, height: 20)
        label.text = player[index]
        label.textAlignment = .left
        label.textColor = .black
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 4, height: 4)
        label.layer.masksToBounds = false
        label.font = UIFont.systemFont(ofSize: 24)
            
        scrollView.addSubview(label)
    }
    
    //프레임 번호 레이블
    func frameNumberLabelCreate() {
        for values in 0..<10 {
            let label = UILabel()
            
            frameNumberLabel.append(label)
            
            if(values < 5){
                frameNumberLabel[values + (index*10)].frame = CGRect(x: 20 + (70 * values), y: 95 + (index * 280), width: 69, height: 20)
                    
                frameNumberLabel[values + (index*10)].text = String(values + 1)
                frameNumberLabel[values + (index*10)].textAlignment = .center
                frameNumberLabel[values + (index*10)].backgroundColor = .lightGray
            }else {
                frameNumberLabel[values + (index*10)].frame = CGRect(x: 20 + (70 * (values - 5)), y: 199 + (index * 280), width: 69, height: 20)
                    
                frameNumberLabel[values + (index*10)].text = String(values + 1)
                frameNumberLabel[values + (index*10)].textAlignment = .center
                frameNumberLabel[values + (index*10)].backgroundColor = .lightGray
            }
            scrollView.contentSize.height = CGFloat(475 * index)
            scrollView.addSubview(frameNumberLabel[values + (index*10)])
        }
    }
    
    //게임 스코어 보여주는 레이블
    func scoreLabelCreate() {
    
        for values in 0..<9 {
            let label = UILabel()

            if(values < 5) {
                label.frame = CGRect(x: 20 + (70 * values), y: 115 + (index * 280), width: 23, height: 23)
                label.text = ""
                label.textAlignment = .center
                label.backgroundColor = .darkGray
            }else {
                label.frame = CGRect(x: 20 + (70 * (values - 5)), y: 219 + (index * 280), width: 23, height: 23)
                label.text = ""
                label.textAlignment = .center
                label.backgroundColor = .darkGray
            }
            scrollView.addSubview(label)
        }
        
        //첫번째 결과
        for values in 0..<10 {
            let label = UILabel()

            person[playerCount].score1Label.append(label)
      
            if(values < 5) {
                person[playerCount].score1Label[values].frame = CGRect(x: 43 + (70 * values), y: 115 + (index * 280), width: 23, height: 23)
                person[playerCount].score1Label[values].text = ""
                person[playerCount].score1Label[values].textColor = .white
                person[playerCount].score1Label[values].textAlignment = .center
                person[playerCount].score1Label[values].backgroundColor = .darkGray
                person[playerCount].score1Label[values].layer.borderWidth = 0.5
                person[playerCount].score1Label[values].layer.borderColor = UIColor.black.cgColor
            }else if(values < 9) {
                person[playerCount].score1Label[values].frame = CGRect(x: 43 + (70 * (values - 5)), y: 219 + (index * 280), width: 23, height: 23)
                person[playerCount].score1Label[values].text = ""
                person[playerCount].score1Label[values].textColor = .white
                person[playerCount].score1Label[values].textAlignment = .center
                person[playerCount].score1Label[values].backgroundColor = .darkGray
                person[playerCount].score1Label[values].layer.borderWidth = 0.5
                person[playerCount].score1Label[values].layer.borderColor = UIColor.black.cgColor
            }else {
                person[playerCount].score1Label[values].frame = CGRect(x: 20 + (70 * (values - 5)), y: 219 + (index * 280), width: 23, height: 23)
                person[playerCount].score1Label[values].text = ""
                person[playerCount].score1Label[values].textColor = .white
                person[playerCount].score1Label[values].textAlignment = .center
                person[playerCount].score1Label[values].backgroundColor = .darkGray
                person[playerCount].score1Label[values].layer.borderWidth = 0.5
                person[playerCount].score1Label[values].layer.borderColor = UIColor.black.cgColor
            }
            scrollView.addSubview(person[playerCount].score1Label[values])
        }
        
        //두번째 결과
        for values in 0..<10 {
            let label = UILabel()
            person[playerCount].score2Label.append(label)
            
            if(values < 5) {
                person[playerCount].score2Label[values].frame = CGRect(x: 66 + (70 * values), y: 115 + (index * 280), width: 23, height: 23)
                person[playerCount].score2Label[values].text = ""
                person[playerCount].score2Label[values].textColor = .white
                person[playerCount].score2Label[values].textAlignment = .center
                person[playerCount].score2Label[values].backgroundColor = .darkGray
                person[playerCount].score2Label[values].layer.borderWidth = 0.5
                person[playerCount].score2Label[values].layer.borderColor = UIColor.black.cgColor
            }
            //score2 view Label
            //10Frame == score3Label
            else if(values < 10){
                //10Frame label
                if(values == 9){
                    person[playerCount].score2Label[values].frame = CGRect(x: 43 + (70 * (values - 5)), y: 219 + (index * 280), width: 23, height: 23)
                    person[playerCount].score2Label[values].text = ""
                    person[playerCount].score2Label[values].textColor = .white
                    person[playerCount].score2Label[values].textAlignment = .center
                    person[playerCount].score2Label[values].backgroundColor = .darkGray
                    person[playerCount].score2Label[values].layer.borderWidth = 0.5
                    person[playerCount].score2Label[values].layer.borderColor = UIColor.black.cgColor
                    
                    person[playerCount].score3Label = UILabel()
                    person[playerCount].score3Label.frame = CGRect(x: 66 + (70 * (values - 5)), y: 219 + (index * 280), width: 23, height: 23)
                    person[playerCount].score3Label.text = ""
                    person[playerCount].score3Label.textColor = .white
                    person[playerCount].score3Label.textAlignment = .center
                    person[playerCount].score3Label.backgroundColor = .darkGray
                    person[playerCount].score3Label.layer.borderWidth = 0.5
                    person[playerCount].score3Label.layer.borderColor = UIColor.black.cgColor
          
                    scrollView.addSubview(person[playerCount].score3Label)
                }else {
                    person[playerCount].score2Label[values].frame = CGRect(x: 66 + (70 * (values - 5)), y: 219 + (index * 280), width: 23, height: 23)
                    person[playerCount].score2Label[values].text = ""
                    person[playerCount].score2Label[values].textColor = .white
                    person[playerCount].score2Label[values].textAlignment = .center
                    person[playerCount].score2Label[values].backgroundColor = .darkGray
                    person[playerCount].score2Label[values].layer.borderWidth = 0.5
                    person[playerCount].score2Label[values].layer.borderColor = UIColor.black.cgColor
                }
            }
            scrollView.addSubview(person[playerCount].score2Label[values])
        }
    }
    
    //토탈 점수 보여주는 레이블
    func totalLabelCreate() {
   
        for values in 0..<10 {

            let label = UILabel()
            person[playerCount].totalLabel.append(label)
            
            if(values < 5) {
                person[playerCount].totalLabel[values].frame = CGRect(x: 20 + (70 * values), y: 138 + (index * 280), width: 69, height: 60)
                person[playerCount].totalLabel[values].text = ""
                person[playerCount].totalLabel[values].textColor = .white
                person[playerCount].totalLabel[values].textAlignment = .center
                person[playerCount].totalLabel[values].backgroundColor = .darkGray
                
            }else {
                person[playerCount].totalLabel[values].frame = CGRect(x: 20 + (70 * (values - 5)), y: 242 + (index * 280), width: 69, height: 60)
                person[playerCount].totalLabel[values].text = ""
                person[playerCount].totalLabel[values].textColor = .white
                person[playerCount].totalLabel[values].textAlignment = .center
                person[playerCount].totalLabel[values].backgroundColor = .darkGray
            }
            scrollView.addSubview(person[playerCount].totalLabel[values])
        }
    }

}
