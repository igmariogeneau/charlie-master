//===============================================
import UIKit
//===============================================
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    //---------------------
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var textview: UITextView!
    //---------------------
    var aDict: [String: [Any]] = [:]
    //---------------------
    let nachos = Nachos(image: "nachos.png", price: 4.99, name: "Nachos", choices: ["Cheese", "Onions", "Salsa"])
    let soup = Soup(image: "soup.jpg", price: 3.99, name: "Soup", choices: ["Chicken", "Rice", "Onion", "Pea", "Tomato"])
    let hamburger = Hamburger(image: "hamburger.jpg", price: 11.99, name: "Hamburger", choices: ["Cheese", "Bacon", "Pickes"])
    let icecream = IceCream(image: "icecream.jpg", price: 5.99, name: "Ice Cream", choices: ["Vanilla", "Chocolate", "Pistachio", "Lemon"])
    let pie = Pie(image: "pie.jpg", price: 6.99, name: "Pie", choices: ["Apple", "Cherry", "Blueberry", "Lemon", "Keylime"])
    //---------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        //---------------------
        aDict["ENTREES"] = []
        aDict["MAIN COURSES"] = []
        aDict["DESSERTS"] = []
        //---------------------
        aDict["ENTREES"]?.append(nachos)
        aDict["ENTREES"]?.append(soup)
        aDict["MAIN COURSES"]?.append(hamburger)
        aDict["DESSERTS"]?.append(icecream)
        aDict["DESSERTS"]?.append(pie)
        //---------------------
    }
    //---------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return aDict.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        let k = Array(aDict.keys)
        let v = aDict[k[section]] as? [Menu]
        return (v?.count)!
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.textColor = UIColor.black
        cell?.backgroundColor = UIColor.clear
        
        let k = Array(aDict.keys)
        let v = aDict[k[indexPath.section]] as? [Menu]
        
        if let aLabel = cell?.viewWithTag(200) as? UILabel {
            aLabel.text = v![indexPath.row].name
        }
        
        if let aLabel = cell?.viewWithTag(300) as? UILabel {
            aLabel.text = "$\(v![indexPath.row].price)"
        }
        
        if let anImageView = cell?.viewWithTag(100) as? UIImageView {
            let anImage = UIImage(named: v![indexPath.row].image)
            anImageView.image = anImage
        }
        
        if let aTextView = cell?.viewWithTag(400) as? UITextView {
            var str = "Choices : "
            for choice in v![indexPath.row].choices {
                str += "\(choice), "
            }
            aTextView.text = doSubstring(originalString: str, theOffset: -2)
        }

        return cell!
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
        
        let k = Array(aDict.keys)
        let v = aDict[k[indexPath.section]] as? [Menu]
        
        var str = "TYPE : \(k[indexPath.section])\n"
        str += "NAME : \(v![indexPath.row].name)\n"
        str += "PRICE : $\(v![indexPath.row].price)\n"
        str += "CHOICES : "
        for choice in v![indexPath.row].choices {
            str += "\(choice), "
        }

        textview.text = doSubstring(originalString: str, theOffset: -2)
    }
    //---------------------
    func doSubstring(originalString orStr: String, theOffset off: Int) -> String {
        let endIndex = orStr.index(orStr.endIndex, offsetBy: off)
        return orStr.substring(to: endIndex)
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let s = Array(aDict.keys)
        if section < s.count {
            return s[section]
        }
        return nil
    }
    //---------------------
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        title.font = UIFont(name: "Fahra", size: 20)
        title.textColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        header.textLabel?.font = title.font
        header.textLabel?.textColor = title.textColor
    }
    //---------------------
}
//===============================================









