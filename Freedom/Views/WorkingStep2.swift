//
//  ContentView.swift
//  Freedom
//
//  Created by BeastMode on 12/3/24.
//

import SwiftUI
import Foundation

struct WorkingStep2: View {
    
////    @State private var gradient = LinearGradient(
//        gradient: Gradient(colors: [.blue.opacity(0.8), .green.opacity(0.5), .red.opacity(0.7)]),
//        startPoint: .topLeading,
//        endPoint: .bottomTrailing
//    )
    
    @State private var gradient = LinearGradient(colors: [Color.black, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing
     )
    
    @EnvironmentObject var freedom: FreedomModelDataStore
    @Binding var path: NavigationPath
    
    var body: some View {
        
        ZStack{
            
            Background()
            
            VStack {
                
                Spacer()
                
                HStack(){
                    
                    ZStack {
                
                        Image("dollar")
                            .resizable()
                            .scaledToFit()
                            
                        
                        Text("Student Loan")
                            .foregroundStyle(.white)
                            .font(.title2)
                        
                    }
                    
                }
                .frame(width: 350, height: 150, alignment: .center)
                .background(Color.black)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                
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
                            
                            Text("$\(freedom.debtBalance.formatted(.number.precision(.fractionLength(0)))) ")
                                .monospacedDigit()
                                .foregroundStyle(.white)
                                .font(.title3)
                        }
                        
                        Spacer()
                        
                        ZStack{
                            
                            CircularProgressBar(progress: freedom.debtPercent/100)
                                .scaledToFit()
                            
                            Text("\(freedom.debtPercent.formatted(.number.precision(.fractionLength(2))))%")
                                .foregroundStyle(.white)
                                .font(.subheadline.italic())
                        }
                        .frame(width: 50, height: 50, alignment: .leading)
                        Spacer()
                        
                    }
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.black)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                .padding(.top, 35)
                                
                Spacer()
                
                HStack{
                       
                        Spacer()
                        Text("ORIGINAL: $\(freedom.debt.formatted(.number.precision(.fractionLength(0))))")
                            .foregroundStyle(.white)
                            .font(.title3)
                        Spacer()
                    
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.black)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                .padding(.top, 35)
                
                Spacer()
                
                HStack{
                    ZStack{
                        
                        LinearGradient(
                            colors: [Color.black, Color.black, Color.red],
                            startPoint: .top, endPoint: .bottom)
                        .opacity(0.1)
                        
                        
                        ProgressView(value: freedom.debtPercent, total: 100)
                            .progressViewStyle(GradientProgressStyle(fill: gradient, height: 15))
                            .padding(.horizontal)
                        
                        Slider(value: $freedom.debtPercent, in: 0...100).disabled(false)
                            .onAppear {
                                
                                let thumbImage = UIImage(named: freedom.debtPercent == 0 ? "" : "slider")
                                
                                
                                
                                UISlider.appearance().setThumbImage(thumbImage, for: .normal)
                                
                            }
                            .padding(.horizontal)
                    }
                }
                .frame(width: 350, height: 150, alignment: .leading)
                .background(Color.black)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                .padding(.top, 35)
                
                Spacer()
            }
        }
    }
}

struct WorkingStep2_Previews: PreviewProvider {
    static var previews: some View {
        WorkingStep2(path: .constant(NavigationPath()))
            .environmentObject(FreedomModelDataStore())
    }
}
