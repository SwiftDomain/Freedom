//
//  ContentView.swift
//  Freedom
//
//  Created by BeastMode on 12/3/24.
//

import SwiftUI
import Foundation

struct WorkingStep6: View {
    
    @State private var gradient = LinearGradient(
        gradient: Gradient(colors: [.blue.opacity(0.8), .green.opacity(0.5), .red.opacity(0.7)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    @EnvironmentObject var freedom: FreedomModelDataStore
    @Binding var path: NavigationPath
    
    var body: some View {
        
        ZStack{
            
            Background()

            VStack {

                VStack {

                    Image("eagle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .padding(.bottom, -75)
                        
                        
                    Text(" Mortgage")
                        .font(.title)
                        .fontWeight(.heavy)
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
     
                }
            Spacer()
            Spacer()
                Spacer()
                 
                ZStack{
                                        
                    ProgressView(value: freedom.mortgagePercent, total: 100)
                        .progressViewStyle(GradientProgressStyle(fill: gradient, height: 15))
                        .padding(.horizontal)
                    
                    Slider(value: $freedom.mortgagePercent, in: 0...100).disabled(false)
                        .onAppear {
                            
                            let thumbImage = UIImage(named: freedom.mortgagePercent == 0 ? "" : "slider")
                            
                            
                            
                            UISlider.appearance().setThumbImage(thumbImage, for: .normal)
                            
                        }
                        .padding(.horizontal)
               }
                .padding(.bottom)
                         
                
                VStack {
                    VStack{
                        Text("Current Balance")
                        Text("$\(freedom.mortgageBalance.formatted(.number.precision(.fractionLength(0))))")
                        
                    }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    
                    Text("REMAINING: $\(freedom.mortgage.formatted(.number.precision(.fractionLength(0))))")
                    Text("\(freedom.mortgagePercent.formatted(.number.precision(.fractionLength(2))))%")
                        .font(.subheadline)
                    
                }
                .background(Color.white.opacity(0.1), alignment: .bottom)
                .clipShape(Rectangle())
                .scaledToFit()
                .padding(.top, 25)
                Spacer()
                
                
            }
        }
    }
}

struct WorkingStep6_Previews: PreviewProvider {
    static var previews: some View {
        WorkingStep6(path: .constant(NavigationPath()))
            .environmentObject(FreedomModelDataStore())
    }
}
