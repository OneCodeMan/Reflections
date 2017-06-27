/*
 Helper functions to generate random entities
 */

import Foundation

class RandomModel {
    
    func generateRandomItem(from array: [Any]) -> Int {
        let maxIndex = array.count - 1
        let randomUnsigned = arc4random_uniform(UInt32((maxIndex) + 1))
        let randomIndex = Int(randomUnsigned)
        return randomIndex
        
    }
    
}
