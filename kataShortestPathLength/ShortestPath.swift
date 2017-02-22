//
//  ShortestPath.swift
//  kataShortestPathLength
//
//  Created by Vivek Vardhan on 2/21/17.
//  Copyright © 2017 Vivek Vardhan. All rights reserved.
//

import Foundation

class ShortestPath {

func shortestPath (a: [[Int]]) ->((result: String, len: Int, path: String)) {
    let rows = a.count , cols = a[0].count
    var dist = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
    
    for i in stride(from: cols - 1, through: 0, by: -1) {
        for j in 0..<rows{
            if(i==cols-1) {
                dist[j][i] = a[j][i]
            }
            else{
                var up = j-1, mid = j, down = j+1
                if(j==0) {
                    up = rows-1
                }
                if(j==rows-1) {
                    down = 0
                }
                let min = findMin(a: dist, i: i+1, up: up, mid: mid, down: down);
                dist[j][i] = a[j][i] + dist[min][i+1];
            }
        }
    }
    return findPath(a: a, dist: dist)
}


func findPath(a: [[Int]], dist: [[Int]]) ->(result: String, len: Int, path: String) {
    
    var distance = Int.max
    var index = 0
    let rows = dist.count
    let cols = dist[0].count
    var path = "";
    var result = "NO";
    var len = 0
    
    for i in 0..<rows {
        
        if(dist[i][0] < distance) {
            distance = dist[i][0];
            index = i
        }
    }
    
    if(distance <= 50) {
        result = "YES"
    }
    
    for i in 0..<cols{
        var up = index - 1, mid = index , down = index + 1
        if (index == 0) {
            up = rows - 1
        }
        if (index == rows-1) {
            down = 0
        }
        index = findMin(a: dist, i: i, up: up, mid: mid, down: down)
        if(len + a[index][i] > 50) {
            print("\(result) Dist: \(len) Path: \(path)")
            return (result,len,path.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines));
        }
        else {
            len += a[index][i]
            path += "\(index+1) "
        }
    }
    return (result,distance,path.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
}
    

func findMin(a: [[Int]], i: Int, up: Int, mid:Int, down:Int) -> Int {
        if(a[up][i]<=a[mid][i] && a[up][i]<=a[down][i]) {
            return up;
        }
        else if(a[mid][i]<=a[up][i] && a[mid][i]<=a[down][i]) {
            return mid;
        }
        else {
            return down;
        }
    }
    
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


