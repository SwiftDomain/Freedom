//
//  ContentView.swift
//  Freedom
//
//  Created by BeastMode on 12/3/24.
//

import SwiftUI
import Foundation

struct WorkingStep: View {
    
    @EnvironmentObject var freedom: FreedomModelDataStore
    @Binding var path: NavigationPath
    
    var body: some View {

        switch freedom.workingStep{
            
        case 1:
            WorkingStep1(path: $path)
        
        case 2:
             WorkingStep2(path: $path)
        case 3:
             WorkingStep3(path: $path)
        case 4:
            WorkingStep4(path: $path)
        case 5:
            ZStack{
                Background()
                
                VStack{
                    //Title
                    HStack(){
                        ZStack {
                            
                            Image("collegeFund")
                                .resizable()
                                .scaledToFit()
                            
                            VStack{
                                
                                Text("College")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                
                                Text("Funds")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                            }
                            
                        }
                    }
                    .frame(width: 350, height: 75, alignment: .center)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0))
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Text("FIU Tuition Waiver")
                            .foregroundStyle(.white)
                            .font(.title3)
                        Spacer()
                    }
                    .frame(width: 350, height: 150, alignment: .leading)
                    .background(Color.gray.opacity(0.09))
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                    
                    Spacer()
                }
            }
        case 6:
             WorkingStep6(path: $path)
        default:
            ZStack{
                Background()
                Text("Nothing to see here")
            }
        }
    }
}

struct WorkingStep_Previews: PreviewProvider {
    static var previews: some View {
        WorkingStep(path: .constant(NavigationPath()))
            .environmentObject(FreedomModelDataStore())
    }
}
