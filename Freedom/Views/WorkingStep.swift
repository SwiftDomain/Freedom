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
            Background()
            Text("SAVED $1,000")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.primary)
        
        case 2:
             WorkingStep2(path: $path)
        case 3:
             WorkingStep3(path: $path)
        case 4:
            ZStack{
                Background()
                Text("Not Investing 15% on Retirement YET")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.primary)
            }
        case 5:
            ZStack{
                Background()
                Text("FIU TUITION WAIVER FTW")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.primary)
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
