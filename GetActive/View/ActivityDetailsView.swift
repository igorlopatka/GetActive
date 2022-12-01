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
        Toggle("is Active", isOn: $vm.isActive)
    }
}

struct ActivityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailsView(vm: ActivityViewModel())
    }
}
