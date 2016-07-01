//
//  ViewController.swift
//  Fight!
//
//  Created by Saketh D on 7/1/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var playerImg2: UIImageView!
    @IBOutlet weak var playerimg1: UIImageView!
    @IBOutlet weak var player2attbtn: UIButton!
    @IBOutlet weak var player1attbtn: UIButton!
    @IBOutlet weak var player1hplbl: UILabel!
    @IBOutlet weak var player2hplbl: UILabel!
    @IBOutlet weak var att1lbl: UILabel!
    @IBOutlet weak var att2Lbl: UILabel!
    @IBOutlet weak var restartLbl: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    
    private var game :Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game.init(player1: Player.init(name: "Player1"), player2: Player.init(name: "Player2"))
        
    }

    @IBAction func attPress(sender: AnyObject) {
        if game.gameGoing(){
            if let tag = sender.tag{
                if tag == 0{
                    outputLbl.text = game.dealDamge(game.playerOne, dmg: game.playerTwo.attpwr)
                    att1lbl.hidden = true
                    player1attbtn.hidden = true
                    NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.toggleButtonOne), userInfo: nil, repeats: false)
                } else {
                    outputLbl.text = game.dealDamge(game.playerTwo, dmg: game.playerOne.attpwr)
                    att2Lbl.hidden = true
                    player2attbtn.hidden = true
                    NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.toggleButtonTwo), userInfo: nil, repeats: false)
                }
            }
        
        
        update()
        }
        
    }
    @IBAction func restartPress(sender: AnyObject) {
        restartBtn.hidden = true
        restartLbl.hidden = true
        game.restart()
        playerImg2.hidden = false
        playerimg1.hidden = false
        update()
    }
    func update(){
        player1hplbl.text = "\(game.playerOne.hp) HP"
        player2hplbl.text = "\(game.playerTwo.hp) HP"
        
        if !game.playerTwo.isAlive(){
            
            playerImg2.hidden = true
            outputLbl.text = "\(game.playerOne._name) won"
            toggleButtonTwo()
            toggleRestartButton()
            
        } else if !game.playerOne.isAlive(){
            
            playerimg1.hidden = true
            outputLbl.text = "\(game.playerTwo._name) won"
            toggleButtonOne()
            toggleRestartButton()
        }
        
    }
    func toggleButtonOne(){
        att1lbl.hidden = false
        player1attbtn.hidden = false
    }
    func toggleButtonTwo(){
        att2Lbl.hidden = false
        player2attbtn.hidden = false
    }
    func toggleRestartButton(){
        if restartLbl.hidden{
            restartBtn.hidden = false
            restartLbl.hidden = false
        } else {
            restartBtn.hidden = true
            restartLbl.hidden = true
        }
    }
    

}


