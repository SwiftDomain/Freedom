//
//  WorkingStep4.swift
//  Freedom
//
//  Created by BeastMode on 1/21/25.
//


//
//  ContentView.swift
//  Freedom
//
//  Created by BeastMode on 12/3/24.
//

import SwiftUI
import Foundation
import Charts

struct WorkingStep4: View {
    
    //    @State private var gradient = LinearGradient(
    //        gradient: Gradient(colors: [.blue.opacity(0.8), .green.opacity(0.5), .red.opacity(0.7)]),
    //        startPoint: .topLeading,
    //        endPoint: .bottomTrailing
    //    )
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var freedom: FreedomModelDataStore
    @Binding var path: NavigationPath
    
    @State private var netWorth: [Networth] = [
        .init(type: "Real Estate", value: 235_442),
        .init(type: "Stocks", value: 540),
        .init(type: "Crypto", value: 218),
        .init(type: "Retirment", value: 277_046)
        
    ]
    
    var body: some View {
        
        ZStack{
            
            Background()
            
            VStack{
                
                //Title
                HStack(){
                    ZStack {
                        
                        Image("investment")
                            .resizable()
                            .scaledToFit()
                        
                        
                        Text("Investments")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .padding(.leading, 30)
                        
                    }
                }
                .frame(width: 350, height: 75, alignment: .center)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0))
                .padding(.top, 20)
                
                Spacer()
                
                ScrollView() {
                    VStack{
                        
                       Spacer()
                        HStack{
                            Text("")
                                .foregroundStyle(.white)
                                .font(.subheadline)                      }
                        .frame(width: 350, height: 20, alignment: .leading)
                                                        
                        ZStack {
                            
                            colorScheme == .dark ? Color.black : Color.white
                            //.opacity(0.8)
                            
                            HStack{
                                
                                Chart(netWorth) { product in
                                    //                                    SectorMark(angle: .value(Text(verbatim: product.type), product.value), innerRadius: .ratio(0.6)//,angularInset: 8
                                    //                                    )
                                    SectorMark(angle: .value("Value", product.value) )
                                        .foregroundStyle(by: .value(Text(verbatim: product.type), product.type))
                                }
                                .scaledToFit()
                            }
                        }
                        .frame(width: 350, height: 150, alignment: .leading)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        .padding(.top, 30)
                    
                        Spacer()
                        
                        
                        HStack{
                            Text("Real Estate")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        
                        
                        ZStack {
                            LinearGradient(
                                colors: [Color.black, Color.black, Color.red],
                                startPoint: .topLeading, endPoint: .bottomTrailing)
                            .opacity(0.3)
                            
                            HStack  {
                                
                                Spacer()
                                
                                VStack{
                                    Text("Debt")
                                        .foregroundStyle(.white)
                                        .font(.title3)
                                    
                                    Text("$234,558")
                                        .monospacedDigit()
                                        .foregroundStyle(.white)
                                        .font(.title3)
                                }
                                
                                Spacer()
                                
                                VStack{
                                    Text("Value")
                                        .foregroundStyle(.white)
                                        .font(.title3)
                                    
                                    Text("$470,000")
                                        .monospacedDigit()
                                        .foregroundStyle(.white)
                                        .font(.title3)
                                }
                                
                                Spacer()
                                
                                VStack{
                                    Text("Equity")
                                        .foregroundStyle(.green)
                                        .font(.title3)
                                    
                                    Text("$235,442")
                                        .monospacedDigit()
                                        .foregroundStyle(.green)
                                        .font(.title3)
                                }
                                
                                Spacer()
                                
                            }
                        }
                        .frame(width: 350, height: 150, alignment: .leading)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                        
                        Spacer()
                        
                        
                        HStack{
                            Text("Stocks")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        
                        HStack{
                            Spacer()
                            VStack {
                                Text("Balance")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                Text("$540")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                            }
                            Spacer()
                        }
                        .frame(width: 350, height: 150, alignment: .leading)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                        Spacer()
                        
                        HStack{
                            Text("Cryptocurrency")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        
                        HStack{
                            Spacer()
                            VStack{
                                Text("Crypto")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                
                                Text("$218.88")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                            }
                            Spacer()
                        }
                        .frame(width: 350, height: 150, alignment: .leading)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                        Spacer()
                        
                        HStack{
                            Text("Retirement")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        
                        HStack{
                            Spacer()
                            VStack{
                                Text("Balance")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                
                                Text("$277,046")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                            }
                            Spacer()
                        }
                        .frame(width: 350, height: 150, alignment: .leading)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

struct WorkingStep4_Previews: PreviewProvider {
    static var previews: some View {
        WorkingStep4(path: .constant(NavigationPath()))
            .environmentObject(FreedomModelDataStore())
    }
}
