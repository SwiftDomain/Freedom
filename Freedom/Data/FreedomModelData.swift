//
//  FreedomModelData.swift
//  Freedom
//
//  Created by BeastMode on 12/4/24.
//
import SwiftUI
import Foundation

struct FreedomModelData: Codable, Identifiable{
    
    let id: Int
    let step1: Bool
    let step2: Bool 
    let step3: Bool
    let step4: Bool
    let step5: Bool
    let step6: Bool
    let step7: Bool
    let workingOn: String
    let debt: Double
    let debtBalance: Double
    let emergencyFund: Double
    let efBalance: Double
    let mortgage: Double
    let mortgageBalance: Double
    let stocks: Double
    let crypto: Double
    let equity: Double
    let retirement: Double

}

class FreedomModelDataStore: ObservableObject{
    
    @Published var freedomModelData:FreedomModelData?
    
    @Published var debt:Double = 0
    @Published var debtBalance:Double = 0
    @Published var debtPercent:Double = 0

    @Published var emergencyFund:Double = 0
    @Published var efBalance:Double = 0
    @Published var efPercent:Double = 0
    
    @Published var mortgage:Double = 0
    @Published var mortgageBalance:Double = 0
    @Published var mortgagePercent:Double = 0
    
    @Published var completedMessage:String = ""
    @Published var workingStep:Int = 1
    
    @Published var stocks:Double = 0
    @Published var crypto:Double = 0
    @Published var equity:Double = 0
    @Published var retirement:Double = 0

    
    init(){
        
        FreedomAPI().getFreedomModelData{ (freedom) in
            
            self.freedomModelData = freedom
            
            self.debt = self.freedomModelData?.debt ?? 1
            self.debtBalance = self.freedomModelData?.debtBalance ?? 0
            self.debtPercent = ((self.debtBalance)/self.debt) * 100
            
            self.emergencyFund = self.freedomModelData?.emergencyFund ?? 0
            self.efBalance = self.freedomModelData?.efBalance ?? 0
            self.efPercent = ((self.efBalance)/self.emergencyFund) * 100
            
            self.mortgage = self.freedomModelData?.mortgage ?? 0
            self.mortgageBalance = self.freedomModelData?.mortgageBalance ?? 0
            self.mortgagePercent = ((self.mortgageBalance)/self.mortgage) * 100
            
            self.stocks = self.freedomModelData?.stocks ?? 0
            self.crypto = self.freedomModelData?.crypto ?? 0
            self.equity = self.freedomModelData?.equity ?? 0
            self.retirement = self.freedomModelData?.retirement ?? 0
        }
    }
    
    func refreshData(){
        
        FreedomAPI().getFreedomModelData{ (freedom) in
            
            self.freedomModelData = freedom
            
            self.debt = self.freedomModelData?.debt ?? 1
            self.debtBalance = self.freedomModelData?.debtBalance ?? 0
            self.debtPercent = ((self.debtBalance)/self.debt) * 100
            
            self.emergencyFund = self.freedomModelData?.emergencyFund ?? 0
            self.efBalance = self.freedomModelData?.efBalance ?? 0
            self.efPercent = ((self.efBalance)/self.emergencyFund) * 100
            
            self.mortgage = self.freedomModelData?.mortgage ?? 0
            self.mortgageBalance = self.freedomModelData?.mortgageBalance ?? 0
            self.mortgagePercent = ((self.mortgageBalance)/self.mortgage) * 100
            
            self.stocks = self.freedomModelData?.stocks ?? 0
            self.crypto = self.freedomModelData?.crypto ?? 0
            self.equity = self.freedomModelData?.equity ?? 0
            self.retirement = self.freedomModelData?.retirement ?? 0
            
        }
        
    }
    
}

class FreedomAPI{
    
    let freedomUrl = URL(string: "https://swiftdomain.github.io/FreedomApp/freedom.json")!
    
    func getFreedomModelData(completion:@escaping (FreedomModelData) -> ()) {
        
        URLSession.shared.dataTask(with: freedomUrl) { data,_,_  in
            
            let freedom = try! JSONDecoder().decode(FreedomModelData.self, from: data!)
            
            DispatchQueue.main.async {
                completion(freedom)
                
            }
        }
        .resume()
    }
    
    func getImage(per: Double)->String{
        
        if per > 66.6{
            return "Trump3"
        }
        else if per > 33.3{
            return "Trump2"
        }
        else{
            return "Trump1"
        }
        
    }
    
    func checkMarkImage(freedom: FreedomModelDataStore, step: Int) -> String{
        
        switch step{
        case 1:
            return freedom.freedomModelData?.step1 ?? false ? "checkmark.square" : "square"
        case 2:
            return freedom.freedomModelData?.step2 ?? false ? "checkmark.square" : "square"
        case 3:
            return freedom.freedomModelData?.step3 ?? false ? "checkmark.square" : "square"
        case 4:
            return freedom.freedomModelData?.step4 ?? false ? "checkmark.square" : "square"
        case 5:
            return freedom.freedomModelData?.step5 ?? false ? "checkmark.square" : "square"
        case 6:
            return freedom.freedomModelData?.step6 ?? false ? "checkmark.square" : "square"
        case 7:
            return freedom.freedomModelData?.step7 ?? false ? "checkmark.square" : "square"
        default:
            return "square"
        }
        
    }
    
    func validateComplete(freedom: FreedomModelDataStore, step: Int)->Bool{
        
        switch step{
        case 1:
            return freedom.freedomModelData?.step1 ?? false
        case 2:
            return freedom.freedomModelData?.step2 ?? false
        case 3:
            return freedom.freedomModelData?.step3 ?? false
        case 4:
            return freedom.freedomModelData?.step4 ?? false
        case 5:
            return freedom.freedomModelData?.step5 ?? false
        case 6:
            return freedom.freedomModelData?.step6 ?? false
        case 7:
            return freedom.freedomModelData?.step7 ?? false
        default:
            return false
        }
    }
    
    func getCompletedMessage(step: Int) -> String{
        
        switch step{
        case 1:
            return "Starter Emergency Fund - Completed"
        case 2:
            return "NO DEBT - FREAKING AWESOME, TRULY BeastMode"
        case 3:
            return "Fully Funded Emergency Fund - 3 Months"
        case 4:
            return "Currently Investing 15% Of The Household Income In Retirement."
        case 5:
            return "FREE FIU TUITION"
        case 6:
            return "Home Paid Off - BEASTMODE FULLY ACHIEVED"
        case 7:
            return "CURRENT MODE: BUILDING WEALTH"
        default:
            return "Error getting message"        }
        
    }
}
    
    struct GradientProgressStyle<Background: ShapeStyle>: ProgressViewStyle {
        
        var fill: Background
        var cornerRadius: CGFloat = 4
        var height: CGFloat = 12
        var animation: Animation = .spring()
        init(fill: Background, height: CGFloat) {
            self.fill = fill
            self.cornerRadius = height / 2
            self.height = height
        }
        
        func makeBody(configuration: Configuration) -> some View {
            let fractionCompleted = configuration.fractionCompleted ?? 0
            
            return VStack {
                ZStack(alignment: .topLeading) {
                    GeometryReader { geo in
                        Rectangle().fill(.gray.opacity(0.3))
                            .overlay(
                                Capsule(style: .circular).fill(fill).frame(maxWidth: geo.size.width * CGFloat(fractionCompleted))
                                    .animation(animation, value: fractionCompleted)
                                ,alignment: .leading)
                        
                    }
                }
                .frame(height: height)
                .cornerRadius(cornerRadius)
            }
        }
    }
    
    struct Background: View {
        
        var body: some View {
            
           LinearGradient(
            colors: [Color.black, Color.red],
            startPoint: .center, endPoint: .topTrailing)
           .opacity(0.2)
                .background(Color.black)
                .ignoresSafeArea()

            
        }
        
    }

    
    struct CheckboxToggleStyle: ToggleStyle {
        
        func makeBody(configuration: Configuration) -> some View {
            
            HStack {
                
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 2)
                    .frame(width: 25, height: 25)
                    .cornerRadius(5.0)
                    .overlay {
                        Image(systemName: configuration.isOn ? "checkmark" : "")
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            configuration.isOn.toggle()
                        }
                    }
                
                configuration.label
                
            }
        }
    }

struct CircularProgressBar: View {
    
    let progress: CGFloat
    
    var body: some View {
        
        VStack(spacing: 30) {
            // Update in CircularProgressBar
            ZStack {
                ActivityProgressView(color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255), progress: progress)
                    .frame(width: 100, height: 100)

            }
        }
    }
}

struct ActivityProgressView: View {
    let color: Color
    let progress: CGFloat
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 40)
                .opacity(0.1)
                .foregroundStyle(color)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 40, lineCap: .butt))
                .foregroundStyle(color)
        }
    }
}

struct Networth: Identifiable {
    let id = UUID()
    let type: String
    let value: Double
}

