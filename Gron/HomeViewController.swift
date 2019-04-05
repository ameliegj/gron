import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var appDescription: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "account"), tag: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Bienvenue !"
        appDescription.text = "Nous savons que changer de système alimentaire peut être quelque chose de compliqué. Grøn va t’aider au quotidien à devenir entièrement végan, en scannant ton alimentation et en te proposant de petits challenges quotidiens. Commence par scanner quelques produits de ton frigo !"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logOutAction(sender: AnyObject) {
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
