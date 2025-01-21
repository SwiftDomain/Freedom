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
                
                //Title
                HStack(){
                    ZStack {
                        
                        Image("house")
                            .resizable()
                            .scaledToFit()
                        
                        VStack {
                            
                            Text("Mortage")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }
                }
                .frame(width: 350, height: 75, alignment: .center)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0))
                .padding(.top, 20)
                 
            //Balance
                 ZStack {
                     LinearGradient(
                         colors: [Color.black, Color.black, Color.red],
                         startPoint: .topLeading, endPoint: .bottomTrailing)
                     .opacity(0.3)
                     
                     HStack  {
                         
                        Spacer()
                        
                        VStack{
                            Text("Balance")
                                .foregroundStyle(.white)
                                .font(.title3)
                            
                            Text("$\(freedom.mortgageBalance.formatted(.number.precision(.fractionLength(0)))) ")
                                .monospacedDigit()
                                .foregroundStyle(.white)
                                .font(.title3)
                        }
                        
                        Spacer()
                        
                        ZStack{
                            
                            CircularProgressBar(progress: freedom.mortgagePercent/100)
                                .scaledToFit()
                            
                            Text("\(freedom.mortgagePercent.formatted(.number.precision(.fractionLength(2))))%")
                                .foregroundStyle(.white)
                                .font(.subheadline.italic())
                        }
                        .frame(width: 50, height: 50, alignment: .leading)
                        Spacer()
                        
                    }
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                .padding(.top, 35)
                   
                Spacer()
                
                // Original Mortgagte
                HStack{
                       
                        Spacer()
                    VStack{
                        Text("Original Mortgage")
                            .foregroundStyle(.white)
                            .font(.title3)
                        Text("$\(freedom.mortgage.formatted(.number.precision(.fractionLength(0))))")
                            .foregroundStyle(.white)
                            .font(.title3)
                    }
                        Spacer()
                        
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))

                Spacer()
                
                //Slider
                HStack{
                    ZStack{
                        
                        LinearGradient(
                            colors: [Color.black, Color.black, Color.red],
                            startPoint: .top, endPoint: .bottom)
                        .opacity(0.1)
                        
                        
                        ProgressView(value: freedom.mortgagePercent, total: 100)
                            .progressViewStyle(GradientProgressStyle(fill: gradient, height: 15))
                            .padding(.horizontal)
                        
                        Slider(value: $freedom.mortgagePercent, in: 0...100).disabled(false)
                            .onAppear {
                                  
                                let thumbImage = UIImage(named: freedom.mortgagePercent == 0 ? "" : "sliderFull")
                                
                                
                                
                                UISlider.appearance().setThumbImage(thumbImage, for: .normal)
                                
                            }
                            .padding(.horizontal)
                    }
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                
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
