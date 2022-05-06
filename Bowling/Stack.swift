//
//  Stack.swift
//  Bowling
//
//  Created by DM on 2021/06/01.
//

import Foundation

class Stack<T> {
    var isEmpty: Bool {
        return self.list.isEmpty
    }
    
    var top: T? {
        return self.list.last
    }
    
    func push(_ item: T) {
        self.list.append(item)
    }
    
    func pop() -> T? {
        return self.list.popLast();
    }
    
    var count:Int {
        return self.list.count
    }
    private var list = [T]()
}
