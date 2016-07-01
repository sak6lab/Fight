//
//  Character.swift
//  Fight!
//
//  Created by Saketh D on 7/1/16.
//  Copyright © 2016 Saketh D. All rights reserved.
//

import Foundation

class Player{
    private var _hp: Int = 100
    var hp :Int{
        get{
            return _hp
        }
    }
    
    var _name: String!
    
    private var _attpwr: Int = 10
    var attpwr :Int{
        get{
            return _attpwr
        }
    }
    
    init(name: String){
        self._name = name
    }
    
    func isAlive() -> Bool{
        if _hp <= 0{
            return false
        }
        return true
    }
    func recieveAtt(dmg :Int){
        _hp -= dmg
    }
    func reset(){
        _hp=100
    }
    
}