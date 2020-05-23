import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Habits
    
    static let listOfHabits = [
        "Meditate", "Exercise", "No Alcohol", "Wake up early", "Read", "Write In Journal",
        "Be Grateful", "Floss", "Drink more water", "Meditate", "Read a book", "Go to gym",
        "Write Three Positive Things About Today", "Take Vitamins", "Pray", "Brush Teeth", "Study", "Take a walk outside",
        "Wake Up On Time", "Make Bed", "No Sweets", "Stretch", "Eat Breakfast", "Brush Teeth at Night",
        "No Smoking", "Cold shower", "Weigh In", "Run", "Walk", "Pushups",
        "No Soda", "Yoga", "Learn To Speak A Foreign Language", "Clean", "Affirmations", "Sleep by Midnight",
        "Eat Fruit", "Inbox Zero", "Slow-Carb Diet from The 4-Hour Body", "Take Multivitamin", "Keep in touch with friends", "Take Medication",
        "Yoga or Stretching", "Save Money", "No Fast Food", "Write To Do List", "Develop A Writing Habit", "Walk 10,000 Steps",
        "No Screens After 10pm", "Practice Musical Instrument", "No Biting Nails", "Good Posture", "Wake up by 6:30", "Read Bible",
        "Quality time with my children", "Track Food", "NoFap habbit", "Workout", "Learn Something New", "The Five Minute Journal",
        "Stop and enjoy life", "Nofap", "Call mom/dad", "No Coffee", "Drink water first thing in the morning", "Intermittent fasting",
        "Eat More Vegetables and Fruits", "No Sugar", "Tell my wife I love her", "Get Out Of Bed The First Time The Alarm Goes Off", "Sleep at least 8 hours 30–60 minutes reading", "Daily Gratitude List",
        "Unclutter", "Watch a TED talk", "Write", "Eat Vegetarian", "Duolingo", "no pmo",
        "Listen more than talk", "Lift Weights", "Sleep at least 7 hours", "Stretch in the morning", "Cook Dinner", "The Calorie Counting Diet",
        "No email before breakfast", "NOBNOM", "Random act of kindness", "Draw", "Consistent Prayer and Bible", "Reading",
        "Spend time outside", "Bring Lunch To Work", "Talk to at least one stranger", "Gratitude Journal", "Listen to podcast", "Write For 30 Minutes", "Crunches", "No Facebook"
    ]
    
    @State private var title = ""
    @State private var description = ""
    @State private var habit = "Some habit"
    @State private var amount = 1
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                Picker("Habits", selection: $habit) {
                    ForEach(Self.listOfHabits, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add habit")
            .navigationBarItems(trailing: Button("Save") {
                let item = HabitsItem(title: self.title, description: self.description, habit: self.habit, amount: self.amount)
                self.habits.items.append(item)
                
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
