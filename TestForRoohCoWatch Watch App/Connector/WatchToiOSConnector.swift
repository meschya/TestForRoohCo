import WatchConnectivity
import UIKit

final class WatchToiOSConnector: NSObject, WCSessionDelegate, ObservableObject {
    
    var session: WCSession
    
    var name: String = ""
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        
    }
    
    func sendPersonToiOS(_ person: Person) {
        if session.isReachable {
            let data: [String : Any] = [
                "name": AppCaption.mockName,
                "age": AppCaption.mockName,
                "weight": AppCaption.mockName
            ]
            session.sendMessage(data, replyHandler: nil, errorHandler: { (error) -> Void in
                print("Error handler: \(error)")})
        } else {
            print("session is not reacheble")
        }
    }
}
