//
//  GameModel.swift
//  who is that pokemon
//
//  Created by brianchuquiruna on 23/06/23.
//

import Foundation

struct GameModel{
    var score = 0
    
    //Revisar respuesta correcta
    mutating func checkAnswer(_ userAnswer:String, _ correctAnswer:String) -> Bool{
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            self.score += 1
            return true
        }else{
            return false
        }
    }
    
    //obtener Score
    func getScore() -> Int{
        return self.score
    }
    
    //reiniciar Score
    mutating func setScore(score: Int){
        self.score = score
    }
    
}
