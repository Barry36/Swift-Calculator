//
//  test.swift
//  calculator
//
//  Created by BarryWang on 2018-06-14.
//  Copyright © 2018 BarryWang. All rights reserved.
//

import Foundation
var string: String?

func checkPrime(n: Int)->Bool{
    var result: Bool = false;
    if n <= 1  {
        return false;
        
    }
    if n <= 3  {
        return true;
        
    }
    if n==2 || n==3 {
        return false;
    }
    var i:Int = 5;
    while i*i<n{
        i=i+1
    }
    return result;
}
