import Foundation

struct HabitsItem: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    let habit: String
    let amount: Int
}
