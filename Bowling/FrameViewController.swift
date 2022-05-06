//
//  FrameViewController.swift
//  Bowling
//
//  Created by DM on 2021/05/25.
//

import UIKit

class FrameViewController : UIViewController {
    var frameNumberLabel : [UILabel] = []
    
    @IBOutlet var plusBtn: UIButton!
    
    @IBOutlet var scrollView: UIScrollView!
    var playerNum: Int = 1
    
    @IBOutlet var tlabel: UILabel!
    
    @IBAction func plusBtnClicked(_ sender: Any) {
        playerNum += 1
        
        if(playerNum == 4){
            plusBtn.isEnabled = false
            plusBtn.layer.backgroundColor = UIColor.lightGray.cgColor
            plusBtn.setTitleColor(UIColor.darkGray, for: .normal)
            plusBtn.alpha = 0.4
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
        frameNumberLabelCreate()
        
        plusBtn.setTitleColor(UIColor.black, for: .normal)
        //plusBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        plusBtn.layer.borderColor = UIColor.lightGray.cgColor
        plusBtn.layer.borderWidth = 1.0
        plusBtn.layer.cornerRadius = 4.0
    }
    //Frame Number Label Create
    func frameNumberLabelCreate() {
            
        for values in 0..<10 {
            let label = UILabel()
            frameNumberLabel.append(label)
            
            if(values < 10){
                frameNumberLabel[values].frame = CGRect(x: 20 + (70 * (values)), y: 238, width: 69, height: 20)
                    
                frameNumberLabel[values].text = String(values + 1)
                frameNumberLabel[values].textAlignment = .center
                frameNumberLabel[values].backgroundColor = .lightGray
                
                scrollView.contentSize.width = self.view.frame.width * CGFloat(values)
                
                scrollView.addSubview(frameNumberLabel[values])
                
            }else {
                frameNumberLabel[values].frame = CGRect(x: 20 + (70 * (values - 5)), y: 342, width: 69, height: 20)
                    
                frameNumberLabel[values].text = String(values + 1)
                frameNumberLabel[values].textAlignment = .center
                frameNumberLabel[values].backgroundColor = .lightGray
            }
            //view.addSubview(frameNumberLabel[values])
        }
    }
}
