
import UIKit

class UISwipableView: UIView {
    
    //This private variable is used to keep the inital center for the target view
    private var initialCenter = CGPoint.zero
    
    //This variable holds the container view for the swipable view
    @IBOutlet weak var containerView: UIView!
    
    //This is the event handler for the swipable view
    var onSwipableViewDismiss: (UIView) -> Void = {_ in }
    
    
    /// Initial Setup for the view
    override func awakeFromNib() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(wasDragged(gesture:)))
        self.addGestureRecognizer(gesture)
    }
    
    
    /// This method is event listener for the drag event
    ///
    /// - Parameter gesture: Sender object of UIPanGesture type
    @objc func wasDragged(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: containerView)
        
        
        if gesture.state == .began{
            if initialCenter == CGPoint.zero{
                initialCenter = self.center
            }
        }
        else{
            //Handle alpha for the view
            if initialCenter.x - location.x > 0{
                print("Moving left")
                self.alpha = location.x/self.initialCenter.x
            }
            else{
                print("Moving Right")
                self.alpha = ((containerView.bounds.width) - location.x)/initialCenter.x
            }
            
            //Set the new center for the view
            self.center.x = location.x
        }
        
        //Dimiss view logic goes here...
        if gesture.state == .ended{
            let displacement = ((initialCenter.x - location.x) > 0) ? (initialCenter.x - location.x) : -(initialCenter.x - location.x)

            if displacement > self.bounds.width/2.0{
                self.alpha = 0.0
                self.onSwipableViewDismiss(self)
            }
            else{
                self.center = self.initialCenter
                self.alpha = 1.0
            }
        }
    }
}
