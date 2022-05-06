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
            "UIView": [ //self.view
                "name": "** Root.UIView 1 **",
                "anchorToObject":[
                    "UIView":[  // layer1
                        "name": "Layer1.UIView",
                        "top": 0,
                        "left": 0,
                        "right": 0,
                        "height": 0.5,  //這裡還不確定
                        "backgroundColorColor": "green",
                        "anchorToObject": [
                            "UIView":[  // layer2
                                "name": "** Layer2.UIView **",
                                "height": 0.6,
                                "width": 0.9,
                                "centerX": "parent.centerXAnchor",
                                "centerY": "parent.centerYAnchor",
                                "cornerRadius": 30,
                                "shadowRadius": 30,
                                "shadowOpacity": 0.5,
                                "shadowOffset": 3.0,
                                "shadowColor": "black",
                                "anchorToObject": [
                                    "UIView": [
                                        "name": "** Layer3.CircleView **",
                                        "makeCircle": true,  //寬高比：1:1，Align object: self (corner、layoutIfNeed)
                                        "centerX": "parent.centerXAnchor",
                                        "centerY": "parent.topAnchor",
                                        "backgroundColorColor": "white",
                                        "anchorToObject": [
                                            "UIImageView":[
                                                "name": "** Layer4.CircleImageView **",
                                                "top": 10.0,
                                                "left": -10.0,
                                                "right": 10.0,
                                                "bottom": -10.0,
                                                "backgroundColor": "white"
                                            ]
                                        ]
                                    ],
                                    "UIView": [
                                        "name": "Layer3.UpPartView",
                                        "height": 0.5,
                                        "topAlight": "Layer3.CircleView",   // 這裡要跟Stanley討論一下 如果沒有topAlight就align parent?
                                        "top": 0,
                                        "left": 0,
                                        "right": 0,
                                        "backgroundColor": "white",
                                        "anchorToObject": [ //Swift/Dictionary.swift:826: Fatal error: Dictionary literal contains duplicate keys
                                            "UILabel":[
                                                "name": "** Layer4.TitleLabel **",
                                                "fontSize": 18,
                                                "centerY": 0.2, // parent multiple 0.3
                                                "centerX": true
                                            ],
                                            "UILabel":[
                                                "name": "** Layer4.DateLabel **",
                                                "centerY": 0.5, // parent multiple 0.3
                                                "centerX": true
                                            ],
                                            "UILabel":[
                                                "name": "** Layer4.PriceLabel **",
                                                "fontSize": 30,
                                                "centerY": true, // parent multiple 0.3
                                                "centerX": true
                                            ],
                                            "UILabel":[
                                                "name": "** Layer4.CurrencyLabel **",
                                                "bottomAlight": "PriceLabelBottom", // align object priceLabel bottom Anchor
                                                "bottom": 0,
                                                "rightAlight": "PriceLabelLeft",    // align object priceLabel trailing Anchor
                                                "right": 5.0
                                            ],
                                            "UILabel":[
                                                "name": "** Layer4.TransactionResultStatusLabel **",
                                                "centerY": 1.6, // parent multiple 1.6
                                                "cneterX": true,
                                                "width": 0.5,
                                                "height": 30,   // self constant 30
                                                "makeCorner": 0.5,  // (layoutIfNeed masksToBounds cornerRaidus = self.height * 0.5)
                                                "textAlight": "center",
                                                "textColor": "white",
                                                "backgroundColorColor": "green"
                                            ],
                                            "UIView":[
                                                "name": "** Layer4.lineView **",
                                                "left": 20,
                                                "right": -20,
                                                "bottom": 0,
                                                "height": 2,    //self ocnstant 2
                                                "backgroundColorColor": "gray",
                                            ]
                                        ]
                                    ],
                                    "UIView":[
                                        "name": "** Layer3.DownPartView **",
                                        "topAlign": "UpPartView",
                                        "right": 0,
                                        "left": 0,
                                        "bottom": 0,
                                        "backgroundColorColor": "white",
                                        "corner": 30,
                                        "anchorToObject":[
                                            "UILabel": [
                                                "name": "** Layer4.leftLabel1 **",  //支払い合計Label
                                                "left": 15, //parent constant 15
                                                "centerY": 0.5,  //parent multiple 0.5
                                                "fontSize": 15
                                            ],
                                            "UILabel": [
                                                "name": "** Layer4.leftLabel2 **",  // 決済番号Label
                                                "left": 15, //parent constant 15
                                                "centerY": 1,  //parent multiple 1
                                                "fontSize": 15
                                            ],
                                            "UILabel": [
                                                "name": "** Layer4.leftLabel3 **",  // 支払い方法Label
                                                "left": 15, //parent constant 15
                                                "centerY": 1.5,  //parent multiple 1
                                                "fontSize": 15
                                            ],
                                            "UILabel": [
                                                "name": "** Layer4.rightLabel1 **",
                                                "right": -15, //parent constant 15
                                                "centerY": 0.5,  //parent multiple 1
                                                "fontSize": 15
                                            ],
                                            "UILabel": [
                                                "name": "** Layer4.rightLabel2 **",
                                                "right": -15, //parent constant 15
                                                "centerY": 1,  //parent multiple 1
                                                "fontSize": 15
                                            ],
                                            "UILabel": [
                                                "name": "** Layer4.rightLabel3 **",
                                                "right": -15, //parent constant 15
                                                "centerY": 1.5,  //parent multiple 1
                                                "fontSize": 15
                                            ],
                                        ]
                                    ]
                                ]
                            ]
                        ]
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
