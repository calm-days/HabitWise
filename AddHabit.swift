

import SwiftUI

struct AddHabit: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    
    @State private var name = ""
    @State private var icon = "plus"
    let figures = ["figure.walk", "square.and.pencil", "fork.knife", "book.closed.fill"]

    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit you want to master", text: $name)
               
                Picker("Pick icon", selection: $icon) {
                    ForEach(figures, id: \.self) {
                        Image(systemName: "\($0)")
                            .font(.title)
                            .padding()
                            
                    }
                }
                .pickerStyle(.automatic)

               
            }
            
            .navigationTitle("New habit")
            .toolbar {
                Button ("Add") {

                    
                    let item = Habit(name: name, icon: icon)
                    withAnimation {habits.items.append(item)}
                    
                    dismiss()
                    
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
