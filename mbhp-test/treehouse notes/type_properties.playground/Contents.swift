/*
 
STORED PROPERTES
 
 */

//  are part of an instance, only way to assoc value w  a struct or class.

struct Account {
    let username: String
    let password: String
}


let acct1 =  Account(username: "rr", password: "fw3r#2s")
acct1.password


// type properties:



// type methods:

class CC {
    static func someMethod() {}
}


struct Point {
    let x: Int
    let y: Int
}


struct Map {
//     this property is assoc w the type Map, but does not need an instance to be accessed.
    static let origin = Point(x: 0, y: 0)
}
Map.origin


//struct Map {
//    //     this property is assoc w the type Map, but does not need an instance to be accessed.
//    static var origin = Point(x: 0, y: 0)
//}
//Map.origin = Point(x: 2, y: 1)





/*
 
 COMPUTED PROPERTIES
 
 */
struct Rectangle {
    let length: Int
    let width: Int
    
    var area: Int {
        // because this is an instance computed property, it can use hte stored properties above.
        return length * width
    }
}


struct Map2 {
    static let origin = Point(x: 0, y: 0)
    
    static var x: Int {
        return origin.x
    }
}


struct Point2 {
    var x: Int = 0
    var y: Int = 0
}


struct Size {
    var width: Int = 0
    var height: Int = 0
    
    // read-only computed property
    var area: Int {
        return height * width
    }
}


struct Rectangle2 {
    var origin = Point2()
    var size = Size()
    
    // computer prop will change (var) and basically a simple method that can't be void.
    var center: Point2{
        get { // calculate dynamically, return it on get
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point2(x: centerX, y: centerY)
        }
        set (centerVal){ // encapsulated code that is run after a val is assigned to the value property
            
            origin.x = centerVal.x - size.width/2
            origin.y = centerVal.y - size.height/2
        }
    }
}


var rect = Rectangle2()
print(rect.center)

rect.size = Size(width: 3, height: 12)
print(rect.center)


rect.center = Point2(x: 10, y: 3)
print(rect.center)
print(rect.origin)


/*
 
 LAZY stored property
 
 */

// init value not calulated till first use of the object
import Foundation

class ReadItLaterNetworkClietn {
    
    // defer the init of objects that are difficult to make. Saves compute power
    // must be a var..
    lazy var session: URLSession = URLSession(configuration: .default)

}






/*
 
 
 
 
 */

import PlaygroundSupport
import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    
    var value: Double = 0.0 {
        
        // willset/didset are property observers..
        willSet {
            print("\nOld value: \(value)")
        }
        
        didSet {
            // called rught after value asigned to stored value
            view.alpha = CGFloat(value)
            print("New value: \(value)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 30/255.0, green: 36/255.0, blue: 40/255.0, alpha: 1.0)
        
        // Add target-action pattern for value changed event
        slider.addTarget(self, action: #selector(viewController.slide(sender:)), for: .valueChanged)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Programmatically add constraints to setup layout
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.heightAnchor.constraint(equalToConstant: 30),
            slider.widthAnchor.constraint(equalToConstant: 200)
            ])
        
    }
    
    // Method for target-action
    @objc func slide(sender: UISlider) {
        value = Double(sender.value)
    }
    
}


let viewController = ViewController()
PlaygroundPage.current.liveView = viewController.view















