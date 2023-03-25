

import Foundation


struct Habit: Identifiable, Codable {
    var id = UUID()
    let name: String
    let icon: String
    //let description: String
    var currentStreak: Int = 0
    var timesCompleted: Int = 0
    var trueOrFalse = false
    
    
    mutating func addCompleted() {
        timesCompleted += 1
    }
    
}
