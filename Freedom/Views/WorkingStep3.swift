//
//  ContentView.swift
//  Freedom
//
//  Created by BeastMode on 12/3/24.
//

import SwiftUI
import Foundation

struct WorkingStep3: View {
    
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
                   
                        Image("saving")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    
                    Text("Emergency Fund")
                        .font(.title)
                        .foregroundColor(.white)
                    
                }
                .frame(width: 350, height: 75, alignment: .center)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0))
                .padding(.vertical, 30)
                
                //Balance Tile
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
                           
                           Text("$\(freedom.efBalance.formatted(.number.precision(.fractionLength(0)))) ")
                               .monospacedDigit()
                               .foregroundStyle(.white)
                               .font(.title3)
                       }
                       
                       Spacer()
                       
                       ZStack{
                           
                           CircularProgressBar(progress: freedom.efPercent/100)
                               .scaledToFit()
                           
                           Text("\(freedom.efPercent.formatted(.number.precision(.fractionLength(2))))%")
                               .foregroundStyle(.white)
                               .font(.subheadline.italic())
                       }
                       .frame(width: 50, height: 50, alignment: .leading)
                       Spacer()
                       
                   }
               }
               .frame(width: 350, height: 150, alignment: .leading)
               .background(Color.gray.opacity(0.09))
               .cornerRadius(20)
               .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                
                Spacer()
                
                // Goal
                HStack{
                       
                        Spacer()
                        Text("Goal: $\(freedom.emergencyFund.formatted(.number.precision(.fractionLength(0))))")
                            .foregroundStyle(.white)
                            .font(.title3)
                        Spacer()
                    
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.gray.opacity(0.09))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                
                Spacer()
                
                HStack{
                    ZStack{
                        
                        LinearGradient(
                            colors: [Color.black, Color.black, Color.red],
                            startPoint: .top, endPoint: .bottom)
                        .opacity(0.1)
                        
                        
                        ProgressView(value: freedom.efPercent, total: 100)
                            .progressViewStyle(GradientProgressStyle(fill: gradient, height: 15))
                            .padding(.horizontal)
                        
                        Slider(value: $freedom.efPercent, in: 0...100).disabled(false)
                            .onAppear {
                                  
                                let thumbImage = UIImage(named: freedom.efPercent == 0 ? "" : "sliderFull")
                                
                                
                                
                                UISlider.appearance().setThumbImage(thumbImage, for: .normal)
                                
                            }
                            .padding(.horizontal)
                    }
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.gray.opacity(0.09))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                
                Spacer()
                
            }
        }
    }
}

struct WorkingStep3_Previews: PreviewProvider {
    static var previews: some View {
        WorkingStep3(path: .constant(NavigationPath()))
            .environmentObject(FreedomModelDataStore())
    }
}
