/*
 Helper functions to generate random entities
 */

import Foundation

class RandomModel {
    
    func generateRandomIndex(from array: [Any]) -> Int {
        
        guard array.count > 0 else { return -1 }
        
        let maxIndex = array.count - 1
        let randomUnsigned = arc4random_uniform(UInt32((maxIndex) + 1))
        let randomIndex = Int(randomUnsigned)
        return randomIndex
        
    }
    
}
