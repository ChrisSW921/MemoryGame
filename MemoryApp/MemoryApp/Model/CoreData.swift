//
//  CoreData.swift
//  MemoryApp
//
//  Created by Theo Davis on 2/11/21.
//

import CoreData

extension Highscore {
    
    @discardableResult convenience init(score: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.score = score
    }
    
}//End of extension
