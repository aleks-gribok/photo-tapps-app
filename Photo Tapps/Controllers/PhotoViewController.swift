import UIKit

class PhotoViewController: UIViewController {
    
    //MARK: - Property
    var image: UIImage?
    
    //MARK: - Outlets
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - LifyCycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = image
    }
    
    //MARK: - Actions
    @IBAction func shareAction(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Good!")
            }
        }
        present(shareController, animated: true)
    }

    //MARK: - Function
    @IBAction func showButton(_ sender: Any) {
        self.hiLabel.text = "Hi, "
        self.alert(title: "Attention!", message: "Enter your name", style: .alert)
    }
    
    //MARK: - create AlertController
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertControl = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .destructive) { (action) in
            let textAlert = alertControl.textFields?.first
            self.hiLabel.text! += (textAlert?.text!)! + ("!")
        }
        alertControl.addTextField { (fak) in
            fak.isSecureTextEntry = false
        }
        alertControl.addAction(action)
        self.present(alertControl, animated: true)
    }
}

