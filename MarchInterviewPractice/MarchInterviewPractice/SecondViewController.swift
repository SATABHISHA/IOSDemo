//
//  SecondViewController.swift
//  MarchInterviewPractice
//
//  Created by SATABHISHA ROY on 03/03/19.
//  Copyright © 2019 SATABHISHA ROY. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class SecondViewController: UIViewController {

    var intPassed=Int()
    var test = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = ViewController()
        print("entered value is \(v.name1)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnSave(_ sender: UIButton) {
        save()
    }
    func save(){
        let apiurl = "http://gangarampur.sambadsaradin.com/Gangarampur_ci/api/take_complaint"
        let data:[String:Any] = ["type":"test",
                                 "name":"test name",
                                 "email":"test@gmail.com",
                                 "phn":"1234567898",
                                 "word":"ward 5",
                                 "address":"test address",
                                 "feedback_msg":"test feedback"
                                 ]
      
        Alamofire.request(apiurl, method:.post,parameters: data,encoding: JSONEncoding.default, headers: nil).responseString{
            response in
            switch response.result{
            case .success:
                let swiftyJsonvar = JSON(response.result.value!)
                
                print(swiftyJsonvar)
                
                break
            case .failure(let error):
                //                 var xml = SWXMLHash.parse(Error)
                //                print(xml)
                print(error)
            }
        }
    }

}
