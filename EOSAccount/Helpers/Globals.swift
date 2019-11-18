
import Foundation

//MARK: - Queues
///shorter implementation of background queue, qos: .default

func backgroundQueue(block: @escaping () -> ()) {
    DispatchQueue.global(qos: .utility).async {
        block()
    }
}

///shorter implementation of main queue, qos: .userInteractive
func mainQueue(block: @escaping () -> ()) {
    DispatchQueue.main.async {
        block()
    }
}
