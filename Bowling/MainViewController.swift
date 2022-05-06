//
//  MainViewController.swift
//  Bowling
//
//  Created by DM on 2021/05/25.
//

import UIKit

class MainViewController : UIViewController {
    //var player : [person] = []
    var playerName : [UITextField] = []
    var playerLabel : [UILabel] = []
    var index : Int = 0
    var lastIndex : Int = 0
    
    @IBOutlet var stpper: UIStepper!
    
    @IBOutlet var image: UIImage!
    
    @IBAction func stepperClick(_ sender: UIStepper) {
        
        index = Int(stpper.value) - 1
        
        if(lastIndex < index){
            //player.append(person())
            
            let textField = UITextField()
            playerName.append(textField)
            playerName[index].frame = CGRect(x: 20, y: 430 + (50 * index), width: 240, height: 34)
            playerName[index].text = ""
            playerName[index].textAlignment = .left
            playerName[index].borderStyle = .roundedRect
            playerName[index].placeholder = "Input Nickname"
            //player[index].nickname = playerName[index].text
            
            let label = UILabel()
            playerLabel.append(label)
            playerLabel[index].frame = CGRect(x: 295, y: 431 + (50 * index), width: 56, height: 20)
            playerLabel[index].text = "\(index + 1)P"
            playerLabel[index].textAlignment = .center
            
        }else {
            playerName[index + 1].removeFromSuperview()
            playerLabel[index + 1].removeFromSuperview()
            
            //player.remove(at: index + 1)
            playerName.remove(at: index + 1)
            playerLabel.remove(at: index + 1)
        }
        
        lastIndex = index
        view.addSubview(playerName[index])
        view.addSubview(playerLabel[index])
    }
    
    @IBAction func Test(_ sender: UIButton) {
        
        for values in 0...index {
            playerName[values].text = self.playerName[values].text
        }
        
        //storyboar id check
        guard let gvc = storyboard?.instantiateViewController(identifier: "ss") as? PlayViewController
        
        else {
            return
        }
        
        for i in 0...index {
            gvc.player.append(playerName[i].text!)
        }
        //gvc.player1.append(playerName[0].text!)
        
        self.navigationController?.pushViewController(gvc, animated: true)
         
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stpper.minimumValue = 1
        stpper.maximumValue = 4
        
        //player.append(person())
        
        let textField = UITextField()
        playerName.append(textField)
        playerName[index].frame = CGRect(x: 20, y: 430 + (50 * index), width: 240, height: 34)
        playerName[index].text = ""
        playerName[index].textAlignment = .left
        playerName[index].borderStyle = .roundedRect
        playerName[index].placeholder = "Input Nickname"
       // player[index].nickname =  playerName[index].text
        
        let label = UILabel()
        playerLabel.append(label)
        playerLabel[index].frame = CGRect(x: 295, y: 431 + (50 * index), width: 56, height: 20)
        playerLabel[index].text = "1P"
        playerLabel[index].textAlignment = .center
        
        view.addSubview(playerName[index])
        view.addSubview(playerLabel[index])
    }
}
