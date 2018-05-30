
import UIKit

class ExampleViewController: UIViewController {
    @IBOutlet weak var swipableViewRed: UISwipableView!
    @IBOutlet weak var swipableViewGreen: UISwipableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        swipableViewRed.onSwipableViewDismiss = { sender in
            print("Red view dismiss")
        }
        
        swipableViewGreen.onSwipableViewDismiss = { sender in
            print("Green view dismiss")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

