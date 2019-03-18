//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let tableView: UITableView = {
        let tbview = UITableView()
        tbview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tbview
    }()
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black

        view.addSubview(label)
        
        view.addSubview(self.tableView)
        self.tableView.frame = CGRect(x: 0, y: 0, width: 375, height: 750)
        self.view = view
    }
    
}

extension MyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = "hello"
        return cell
    }
    
    
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
