//
//  FakeLocationDetector.swift
//  Tawakkalna
//
//  Created by Saleh AlDhobaie on 22/05/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxCoreLocation

/*
*
* /// As per the code below didSet will called evrey time we do appened to the array.

class Container {
    var strings: [String] = [] {
        didSet {
            Swift.print("Change strings: \(self.strings)")
        }
    }
}
let container = Container()
container.strings = ["One"]
container.strings.append("Two")
container.strings.append("Three")
*/

struct FakeLocation {
	let latitude: Double
	let longitude: Double
	init(location: CLLocation) {
		latitude = location.coordinate.latitude
		longitude = location.coordinate.longitude
	}
}

// for equalirty ===
// Ref: https://developer.apple.com/documentation/swift/hashable
extension FakeLocation: Equatable {
	static func ==(lhs: Self, rhs: Self) -> Bool {
		return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
	}
}

// To be use with `Set`
// Ref: https://developer.apple.com/documentation/swift/hashable
extension FakeLocation: Hashable {
	// Synthesized by compiler
    func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
