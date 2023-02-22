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
            HStack {
                
                Button(vm.isPaused ? "Resume" : "Pause") {
                    vm.isPaused.toggle()
                }
                
                Button(vm.isActive ? "Finish" : "Start") {
                    vm.isActive.toggle()
                }
            }
            Text("Current speed: \(vm.speedKMH) km/h")
            Text("Distance: \(vm.distanceM) m")
        }
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(vm: ActivityViewModel())
    }
}
