//
//  PayPayViewController.swift
//  CodingStyleOfConstraint
//
//  Created by TBCASoft-Bennett on 2022/5/4.
//

import UIKit




class PayPayViewController: UIViewController {
    
    var jsonResult: PayPayJson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
//        loadBuildingInfoJsonInit()
        
        let paypay = [
            "UIView": [
                "name": "** Root.UIView 1 **",
                "arg1": "UIView.111",
                "arg2": "UIView.222",
                "arg3": "UIView.333",
                "anchorToObject":[
                    "UILabel":[
                        "name": "** Layer1.UILabel **",
                        "arg1": "Layer1.UILabel.1111",
                        "arg2": "Layer1.UILabel.2222",
                        "arg3": "Layer1.UILabel.3333"
                    ],
                    "UIView":[
                        "name": "** Layer1.UIView **",
                        "anchorToObject": [
                            "UIImageView": [
                                "name": "** Layer2.UIImageView **",
                                "arg1": "Layer2.UIImageView.111",
                                "arg2": "Layer2.UIImageView.222",
                                "arg3": "Layer2.UIImageView.333"
                            ]
                        ]
                    ],
                    "UIImageView":[
                        "name": "** Layer1.UIView **",
                        "anchorToObject":[
                            "UIImageView":[
                                "name":"** Layer2.UIImage **",
                                "arg1":"Layer2.UILabel.1111",
                                "arg2":"Layer2.UILabel.2222",
                                "arg3":"Layer2.UILabel.3333",
                            ]
                        ]
                        
                    ]
                ]
            ],
            "UIImageView":[
                "name": "** Root.UIImage 1 **",
                "arg1": "UIView.1111",
                "anchorToObject":[
                    "UILabel":[
                        "name": "**Layer1.UILabel **"
                    ]
                ]
            ]
        ]
        loadAndDraw(jsonObject: paypay, parent: "root")
    }
    
    func loadAndDraw(jsonObject: [String: [String:Any]], parent: String){
        for (key, _) in jsonObject {
            
            
            switch key{
            case "UIView":
                print("\n\n>>>>>>draw for UIView: \(String(describing: jsonObject[key]?["name"]))  on top of \(parent)")
            case "UIImageView":
                print("\n\n>>>>>>draw for UIImageView: \(String(describing: jsonObject[key]?["name"]))  on top of \(parent)")
            case "UILabel":
                print("\n\n>>>>>>draw for UILabel: \(String(describing: jsonObject[key]?["name"]))  on top of \(parent)")
            default:
                return
            }
            
            if((jsonObject[key]?["anchorToObject"]) != nil) {
                loadAndDraw(jsonObject: jsonObject[key]?["anchorToObject"] as! [String : [String : Any]], parent: jsonObject[key]?["name"] as! String)
            }
        }
        
        
        
    }
    
    // decoder json file
    func loadBuildingInfoJsonInit() {
        do {
            let url = Bundle.main.url(forResource: "paypay", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(PayPayJson.self, from: data)
            jsonResult = result
            print(jsonResult)
            
        } catch {
            print(error)
        }
    }

   
}
