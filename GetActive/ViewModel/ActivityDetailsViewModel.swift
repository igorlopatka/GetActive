//
//  ActivityDetailsViewModel.swift
//  GetActive
//
//  Created by Igor Łopatka on 28/11/2022.
//

import Foundation
import CoreLocation

class ActivityViewModel: ObservableObject {
    
    @Published var isActive = false
    @Published var timer = TimerManager()
    @Published var locationManager = CLLocationManager()
    
    
    
    
    
    
    
}
