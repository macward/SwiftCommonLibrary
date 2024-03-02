//
//  NetworkMonitor.swift
//
//
//  Created by Max on 27/02/2024.
//

import Foundation
import Network
import Combine

/// Monitors the network connectivity status, publishing changes through a Combine publisher.
final public class NetworkMonitor {
    
    /// The singleton instance of `NetworkMonitor`.
    public static let shared = NetworkMonitor()

    /// A publisher that emits network status changes.
    private let statusChangePublisher = PassthroughSubject<Bool, Never>()

    /// The dispatch queue used for the network monitor.
    private let queue = DispatchQueue.global()
    
    /// The network path monitor.
    private let monitor: NWPathMonitor

    /// A public publisher for network status changes. Removes duplicates and uses `AnyPublisher` for type erasure.
    public var networkChangePublisher: AnyPublisher<Bool, Never> {
        statusChangePublisher
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    /// Initializes a new instance of `NetworkMonitor` and sets up the path update handler.
    public init() {
        monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [weak self] path in
            let isConnected = path.status == .satisfied
            
            // Send network status updates on the main thread.
            DispatchQueue.main.async {
                self?.statusChangePublisher.send(isConnected)
            }
        }
    }

    /// Starts monitoring the network connectivity status.
    public func startMonitoring() {
        monitor.start(queue: queue)
    }

    /// Stops monitoring the network connectivity status.
    public func stopMonitoring() {
        monitor.cancel()
    }
}
