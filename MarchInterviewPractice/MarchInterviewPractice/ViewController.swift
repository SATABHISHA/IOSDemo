//
//  ViewController.swift
//  MarchInterviewPractice
//
//  Created by SATABHISHA ROY on 03/03/19.
//  Copyright © 2019 SATABHISHA ROY. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import SWXMLHash

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
//        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ViewControllerTableViewCell
        var dict = arrRes[indexPath.row]
        cell.title.text = dict["news_content"] as? String
        var imageurl = dict["news_image"] as? String
        let url = URL(string: imageurl!)
        cell.newsImage.af_setImage(withURL: url!)
        return cell
    }
    
var myInt = Int()
    var name1:String!
    @IBOutlet weak var corpId: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var pswrd: UITextField!
    @IBOutlet weak var tableview: UITableView!
    var arrRes = [[String:AnyObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myInt = 5
        self.name1 = "Git"
        fetchData()
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn(_ sender: UIButton) {
        print("selected")
        let myVC = storyboard?.instantiateViewController(withIdentifier: "demosecond") as! SecondViewController
        myVC.intPassed = 10
        myVC.test = "Hello"
        navigationController?.pushViewController(myVC, animated: true)
//        self.performSegue(withIdentifier: "Second", sender: self)
    }
    
    @IBAction func testbtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Second", sender: self)
    }
    func login(){
        let apiurl = "http://220.225.40.151:9012/TimesheetService.asmx/ValidateTSheetLogin"
        let data:[String:Any] = ["CorpID":"gst-inc-101",
                                 "UserName":"ob",
                                 "Password":"ob"]
        Alamofire.request(apiurl,method: .post, parameters: data,encoding: JSONEncoding.default,headers: nil).responseString{
            response in
            switch response.result{
            case .success:
//                var xml = SWXMLHash.parse(data!)
                var xml = SWXMLHash.parse(response.result.value!)
                let swiftyjsonvar = JSON(response.result.value!)
                print(xml)
                print("success")
                break
            case .failure(let error):
//                 var xml = SWXMLHash.parse(Error)
//                print(xml)
                print(error)
            }
        }
        
    }
    
    @IBAction func Login(_ sender: UIButton) {
        self.login()
    }
    func fetchData(){
        let apiurl = "http://gangarampur.sambadsaradin.com/Gangarampur_ci/api/fetch_news"
        Alamofire.request(apiurl).responseJSON{(responseData) -> Void in
            if ((responseData.result.value) != nil){
                let swiftyJsonvar = JSON(responseData.result.value!)
//                print(swiftyJsonvar)
                if let resData = swiftyJsonvar.arrayObject{
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count>0{
                    self.tableview.reloadData()
                    print(self.arrRes)
                }
            }
            
        }
    }
    
}

