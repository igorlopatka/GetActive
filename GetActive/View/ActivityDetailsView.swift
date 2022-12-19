//
//  ActivityDetailsView.swift
//  GetActive
//
//  Created by Igor Łopatka on 07/11/2022.
//

import SwiftUI

struct ActivityDetailsView: View {
    
    @ObservedObject var vm: ActivityViewModel
    
    var body: some View {
        VStack {
            Toggle("is Active", isOn: $vm.isActive)
            Text("Current speed: \(String(format: "%.2f", vm.speed * 3.6)) km/h")
            Text("Current tempo: ")
            Text("Distance: ")
            Text("Burned kcal: ")
        }
        
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(vm: ActivityViewModel())
    }
}
