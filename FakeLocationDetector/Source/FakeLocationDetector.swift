//
//  APIErrors.swift
//  Alamofire
//
//  Created by AbdallahJaja on 24/08/2020.
//
import CoreLocation
import RxSwift
import Constants

public class FakeLocationDetector : NSObject {
    public static let shared = FakeLocationDetector()

    private let manager = CLLocationManager()
    private let disposeBag : DisposeBag = DisposeBag()

    private let validationCount : Int = 30
    var fakeLocationStatus : FakeLocationType?
    var shouldStopUpdating : Bool = false

    // Regoular Status or Type`ish
    enum FakeLocationType : Int {
        case realLocation = 0
        case fakeLocation = 1
        //case notSure = "UNCOVERED_CASE"
    }

    var locations : [FakeLocation] = [] {
        didSet {
            // here I will check the value to make sure I'm not abuse the array and fill memory.
            if locations.count >= validationCount {
                validateFakeLocation(locations: locations)
            }
        }
    }

    override init() {
        //
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.allowsBackgroundLocationUpdates = true
        manager.pausesLocationUpdatesAutomatically = false
    }

    public func start() {
        //
        configureBinding()
        //startUpdating()
    }

    public func startUpdating(){

        NSObject.cancelPreviousPerformRequests(withTarget: self,
                                               selector: #selector(self.resetLocationToUpate),
                                               object: nil)
        shouldStopUpdating = false
        resetLocationToUpate()
    }

    @objc func resetLocationToUpate(){

        self.manager.stopUpdatingLocation()

        if shouldStopUpdating == false {
            self.manager.startUpdatingLocation()
        }

    }
    /// Configure binding as I'm using Reactive instead of delegation
    private func configureBinding() {

        /// Receive an event for user location
        manager.rx.didUpdateLocations.asDriver()
            .drive(onNext: { [unowned self] location in
                guard let last = location.locations.last else { return }
                // I will add to locations array max 40 locations
                if self.locations.count <= self.validationCount {
                    let fakeLocation = FakeLocation(location: last)
                    self.locations.append(fakeLocation)
                }


                NSObject.cancelPreviousPerformRequests(withTarget: self,
                                                       selector: #selector(self.resetLocationToUpate),
                                                       object: nil)

                if self.shouldStopUpdating == false {
                    self.perform(#selector(self.resetLocationToUpate), with: nil, afterDelay: 2)
                }

            }).disposed(by: disposeBag)
    }

    private func validateFakeLocation(locations: [FakeLocation]) {
        // the beauty of convert array to set is to minimize the number of items in array as CLLocation is confirming to Equatable protocol
        let locationsSets : Set<FakeLocation> = Set(locations)
        if locationsSets.count <= 3 {
            // assign value
            fakeLocationStatus = .fakeLocation
            UserDefaults.standard.set(true, forKey: KMUserDefault.isAdvancedGPS)

        }else{
            // assuming the artical I read is correct!
            // https://stackoverflow.com/questions/29232427/ios-detect-mock-locations
            fakeLocationStatus = .realLocation
            UserDefaults.standard.set(false, forKey: KMUserDefault.isAdvancedGPS)
        }

        // remove all locations to cover case that user is useing a real device and then `fake` location
        self.locations.removeAll()
        shouldStopUpdating = true
        NSObject.cancelPreviousPerformRequests(withTarget: self,
                                               selector: #selector(self.resetLocationToUpate),
                                               object: nil)
    }

}
