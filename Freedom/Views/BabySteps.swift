//
//  Main.swift
//  Freedom
//
//  Created by BeastMode on 12/4/24.
//
import SwiftUI 

struct BabySteps: View{
    
    
    //@StateObject
    @StateObject private var freedom: FreedomModelDataStore
    
    //@State
    @State private var path = NavigationPath()
    @State private var showStep: Bool = false
    @State private var completedStep: Bool = false
    @State private var steps:[Int] = [1,2,3,4,5,6,7]
    
    let layout = [
        GridItem(.adaptive(minimum: 950)),
    ]
    
    init(){
        
        _freedom = StateObject(wrappedValue: FreedomModelDataStore())
        
    }
    
    var body: some View {
        
        ZStack{
            
            NavigationStack(path: $path) {
                
                ScrollView(showsIndicators: false) {
                    
                    LazyVGrid(columns: layout) {
                        
                        VStack(spacing: 15) {
                            
                            ForEach(steps, id: \.self) { step in
                                
                                Button(action: {
                                    
                                    completedStep = FreedomAPI().validateComplete(freedom: freedom, step: step)
                                    freedom.completedMessage = FreedomAPI().getCompletedMessage(step: step)
                                    freedom.workingStep = step
                                    
                                    self.showStep.toggle()
                                    
                                })
                                {
                                    StepCell(step: step)
                                }
                            }
                        }

                    }
                }
                .refreshable {
       freedom.refreshData()
                }
                .navigationTitle("Baby Steps")
            }
            .sheet(isPresented: $showStep)
            {
                if  completedStep{
                    CompletedStep(path: $path)
                }
                else {
                    WorkingStep(path: $path)
                }
            }
        }
        .environmentObject(freedom)
        
    }
}

struct StepCell: View {
    
    @EnvironmentObject var freedom: FreedomModelDataStore
    var step: Int
    
    init(step: Int) {
        self.step = step
    }
    
    var body: some View {
        
        HStack{
            
            Image(systemName: FreedomAPI().checkMarkImage(freedom: freedom, step: step))
            
            Image("Step\(step)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
        .padding(.horizontal)
        .shadow(color: freedom.freedomModelData?.workingOn ?? "" == "step\(step)" ? Color("Step\(step)") : .white, radius: 3)    }
}

#Preview(){
    BabySteps()
}


