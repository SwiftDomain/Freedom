//
//  Step1.swift
//  Freedom
//
//  Created by BeastMode on 12/4/24.
//
import SwiftUI
import Foundation

struct CompletedStep: View {
    
    @EnvironmentObject var freedom: FreedomModelDataStore
    @Binding var path: NavigationPath
    
    var body: some View {
        
        ZStack{
            Image("Anime")
                .resizable()
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .overlay(alignment: .top){
                    
                    VStack(spacing: 25) {
                        
                        Text("Step Completed")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                        
                        Text("\(freedom.completedMessage)")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .fontWeight(.heavy)
                        
                        
                    }
                    .shadow(color: Color.black.opacity(0.7), radius: 8, x: 0, y: 15)
                    .padding(.top, 50)
                }
        }
    }
}

struct CompletedStep_Previews: PreviewProvider {
    static var previews: some View {
        CompletedStep(path: .constant(NavigationPath()))
            .environmentObject(FreedomModelDataStore())
    }
}
