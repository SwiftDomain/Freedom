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
        
        let imageName = colorScheme == .dark ?  "world31" : "world"

        ZStack{
            
            Background()
            
            VStack{
             
                Spacer()
                
                ScrollView() {
                    VStack{
                        
                        Spacer()
                        
                        HStack{
                            Text("Stocks")
                                .foregroundStyle(Color.gray)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        .padding(.top, 30)
                        
                        HStack{
                            ZStack{
                                
                                Image("bullBear")
                                    .resizable()
                                    .scaledToFill()
                                
                                VStack {
                                    Text("Balance")
                                    Text("$\(freedom.stocks.formatted(.number.precision(.fractionLength(0)))) ")
                                }
                                .font(.largeTitle)
                                .background {
                                    Color.black
                                        .blur(radius: 41, opaque: false)
                                }
                            }
                        }
                        .frame(width: 350, height: 150)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("Cryptocurrency")
                                .foregroundStyle(Color.gray)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        
                        HStack{
                            ZStack {
                                
                                Image("crypto")
                                    .resizable()
                                    .scaledToFill()
                                
                                VStack{
                                    Text("Cryptocurrency")
                                    Text("$\(freedom.crypto.formatted(.number.precision(.fractionLength(0)))) ")
                                }
                                .font(.largeTitle)
                                .background {
                                    Color.black
                                        .blur(radius: 41, opaque: false)
                                }                            }
                        }
                        .frame(width: 350, height: 150, alignment: .leading)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                        Spacer()
                        
                        HStack{
                            Text("Real Estate")
                                .foregroundStyle(Color.gray)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        
                        
                        HStack  {
                            
                            ZStack{
                                
                                Image("realEstate")
                                    .resizable()
                                    .scaledToFill()
                                
                                VStack{
                                    Text("Equity")
                                    
                                    Text("$\(freedom.equity.formatted(.number.precision(.fractionLength(0)))) ")
                                        .monospacedDigit()
                                }
                                .font(.largeTitle)
                                .background {
                                    Color.black
                                        .blur(radius: 41, opaque: false)
                                }
                                
                            }
                        }
                        .frame(width: 350, height: 150)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                        
                        Spacer()
                        
                        HStack{
                            Text("Retirement")
                                .foregroundStyle(Color.gray)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .frame(width: 350, height: 20, alignment: .leading)
                        
                        HStack{
                            ZStack {
                                
                                Image("retirement")
                                    .resizable()
                                    .scaledToFill()
                                
                                VStack{
                                    Text("Balance")
                                    Text("$\(freedom.retirement.formatted(.number.precision(.fractionLength(0)))) ")
                                }
                                .font(.largeTitle)
                                .background {
                                                    Color.white
                                                        .blur(radius: 31, opaque: false)
                                                }
                            }
                        }
                        .frame(width: 350, height: 150, alignment: .leading)
                       // .background(Color.gray.opacity(0.09))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 0.3))
                        
                        Spacer()
                        
                        HStack{
                            
                            ZStack {
                                
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                
                                    Chart(netWorth) { investment in
                                        //   SectorMark(angle: .value(Text(verbatim: product.type), product.value), innerRadius: .ratio(0.6)//,angularInset: 8
                                        //                                    )
                                        SectorMark(angle: .value("value", investment.value))
                                            .foregroundStyle(by: .value(Text(verbatim: investment.type), investment.type))
                                    }
                                    .scaledToFit()
                                    .frame(width: 350, height: 150)
                                
                            }
                        }
                        .frame(width: 350, height: 150)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: 0.3))
                        .padding(.top, 30)
                        
                        Spacer()

                    }
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.teal, .indigo],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
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
