//
//  ContentView.swift
//  WeSplit
//
//  Created by Agastya Gaur on 28/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount=0.0
    @State private var tipPercentage=10
    @State private var numberOfPeople=2
    @FocusState private var isFocused:Bool
    let tipPercentages=[0,10,15,20]
    // updated
    
    var totalPerPerson:Double{
        let peopleCount = Double(numberOfPeople + 2)
            let tipSelection = Double(tipPercentage)

            let tipValue = checkAmount / 100 * tipSelection
            let grandTotal = checkAmount + tipValue
            let amountPerPerson = grandTotal / peopleCount

            return amountPerPerson
       // return 0
    }
   //@State private var selected="agastya"
    var body: some View {
        
        NavigationStack{
            Form{
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad).focused($isFocused)
                    Picker("select the people", selection: $numberOfPeople){
                        ForEach(2..<10){
                            Text("\($0) people")
                        }
                    }  //.pickerStyle(.navigationLink)
                    }
                
                Section("How much tip do you want to leave?"){
                    
                    Picker("tip percentage",selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self) {
                                    Text($0, format: .percent)
                                }
                    } .pickerStyle(.segmented)
                }
                
                Section("Amount per person:") {
                       Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                   }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if isFocused{
                    Button("done"){
                        isFocused=false
                    }
                }
            }
        }
       
        
        
       // code above this
    }
}

#Preview {
    ContentView()
}
