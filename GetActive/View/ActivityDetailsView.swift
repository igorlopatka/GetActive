//
//  ActivityDetailsView.swift
//  GetActive
//
//  Created by Igor Łopatka on 07/11/2022.
//

import SwiftUI

struct ActivityDetailsView: View {
    
    @ObservedObject var vm: ActivityViewModel
    @ObservedObject var timer: TimerManager

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
            Text("Time: \(String(format: "%.2f", timer.counter)) s")
        }
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(vm: ActivityViewModel(), timer: TimerManager())
    }
}
