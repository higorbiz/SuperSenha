//
//  PasswordsGenerator.swift
//  SuperSenha
//
//  Created by retina on 28/02/18.
//  Copyright © 2018 retina. All rights reserved.
//

import Foundation

class PasswordsGenerator {
    
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=~`|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    // construtor
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool){
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.useSpecialCharacters = useSpecialCharacters
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.numberOfCharacters = numchars
        
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        // quando geramos um array de string ele passa a ser um array de caracters
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        
        return passwords
    }
    
}
