//
//  Game.swift
//  Fight!
//
//  Created by Saketh D on 7/1/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import Foundation
class Game{
    private var _playerOne: Player
    var playerOne: Player{
        get{
            return _playerOne
        }
    }
    
    private var _playerTwo: Player
    var playerTwo: Player{
        get{
            return _playerTwo
        }
    }

    init(player1 :Player, player2: Player){
        self._playerOne = player1
        self._playerTwo = player2
    }
    
    func dealDamge(player: Player, dmg: Int) -> String?{
        if player.isAlive(){
            player.recieveAtt(dmg)
            return "\(player._name) has been hit for \(dmg) HP"
        }
        return nil
    }
    func restart(){
        playerOne.reset()
        playerTwo.reset()
    }
    func gameGoing() -> Bool{
        if playerOne.isAlive() && playerTwo.isAlive(){
            return true
        }
        return false
    }
    
}