//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    typealias Location = CGPoint
    typealias Distane = Double
    
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
    
    func distance(from location: Location, to anotherLocation: Location) -> Distane{
        let dx = Distane(location.x - anotherLocation.x)
        let dy = Distane(location.y - anotherLocation.y)
        return sqrt(dx * dx + dy * dy)
    }
    
    
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
