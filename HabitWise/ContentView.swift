

import SwiftUI

struct ContentView: View {
    let gradient = LinearGradient(gradient: Gradient(colors: [.yellow, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    
    @State private var habitToComplete: Int = 0
    
    func editStreak() {
        habits.items[habitToComplete].addCompleted()
    }
    
    
    var body: some View {
        NavigationView {


            List {
                
                ForEach(habits.items, id: \.id) { item in
                    Section {
                        HStack {
                            VStack(alignment: .center) {
                                
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 70, height: 70)
                                        .foregroundColor(.yellow)


                                    Image(systemName: "\(item.icon)")
                                        .foregroundColor(.black)
                                        .font(.largeTitle)
                                    
                                   
                                }
                                
        //                        Text("Reading")
        //                            .font(.body)
                                
                            }
                            
                            
                            Spacer()
                            
                            VStack {
                                Spacer()
                                Text("\(item.name)")
                                    .font(.title3)
                                    .fontWeight(.bold)

                                
                                Divider()
                                HStack {
                                    
                                    Text("Mo")
                                        .font(.caption)
                                        .frame(width: 20, height: 20)
                                    Text("Tu")
                                        .font(.caption)
                                        .frame(width: 20, height: 20)
                                    Text("We")
                                        .font(.caption)
                                        .frame(width: 20, height: 20)
                                    Text("Th")
                                        .font(.caption)
                                        .frame(width: 20, height: 20)
                                    Text("Fr")
                                        .font(.caption)
                                        .frame(width: 20, height: 20)
                                    Text("Sa")
                                        .font(.caption)
                                        .frame(width: 20, height: 20)
                                    Text("Su")
                                        .font(.caption)
                                        .frame(width: 20, height: 20)
                                }
                                
                                
                                HStack {
                                    
                                    ForEach(0..<item.timesCompleted) { circle in

                                        Circle()
                                            .fill(.yellow)
                                            //.strokeBorder(.yellow)
                                            .frame(width: 20, height: 20)
                                    }
                                    
                                    
                                }
                                Spacer()
                            }
                            
                            
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button { //action
                            
                            habitToComplete = 1
                            editStreak()
                            
                            
                            //habitToComplete = self.habits.items.count
                            //print(habitToComplete)
                            
                        } label: {
                            Label("Complete", systemImage: "chevron.right")
                        }
                        .tint(.green)
                    }
                    .swipeActions {
                        Button { //action
                        } label: {
                            Label("Skip", systemImage: "chevron.left")
                        }
                        .tint(.purple)
                    }

                    








                }



            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabit(habits: habits)
            }
            .listStyle(.insetGrouped)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        
                        Text("HabitWise")
                            .font(.title)
                            .fontWeight(.black)

                            .foregroundStyle(gradient)
                           
                    }
                }
            }
            
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingAddHabit.toggle()
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.purple)
                }
            }

        }

        
        


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
