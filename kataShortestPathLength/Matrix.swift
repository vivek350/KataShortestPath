//
//  Matrix.swift
//  kataShortestPathLength
//
//  Created by Vivek Vardhan on 3/2/17.
//  Copyright © 2017 Vivek Vardhan. All rights reserved.
//

import Foundation

class Matrix {
    var rows: [[String]] = []
    
    //Creates a 2D matrix by appending the rows entered by the user
    func createMatrix()->[[Int]] {
        var rowMatrix = [[Int]]()
        for row in rows {
            let intRow = row.map{Int($0)}
            rowMatrix.append(intRow as! [Int])
        }
        return rowMatrix
    }
    
    //Verifies the row, if the user entered anything other than an integer
    func rowVerification(input: [Any]) -> Bool {
        for value in 0..<input.count {
            let output: Int? = Int(String(describing: input[value]))
            if output == nil {
                return false
            }
        }
        return true
    }
    
    
}
