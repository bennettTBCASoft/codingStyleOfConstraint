//
//  ViewController.swift
//  CodingStyleOfConstraint
//
//  Created by 竣亦 on 2022/4/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setBaiseViewLayout()
        setSecondViewLayout()
    }

    func setBaiseViewLayout() {
        let topView = UIView()
        topView.backgroundColor = .green
        topView.translatesAutoresizingMaskIntoConstraints = false
            
       
        self.view.addSubview(topView)
        
        // MARK: Constraints
        // 高度
        topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        
        // 上、左、右
        topView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.35).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        topView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        topView.layoutIfNeeded()    // 要有這一行才能拿到topView.bounds
        // 加入漸層 gradientView // background
        // MARK: !!!
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = topView.bounds
        gradientLayer.colors = [UIColor(red: 103/255, green: 214/255, blue: 139/255, alpha: 1.0).cgColor, UIColor(red: 110/255, green: 155/255, blue: 129/255, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        topView.layer.addSublayer(gradientLayer)
        
    }
    
    func setSecondViewLayout() {
        let secondView = UIView()
        secondView.backgroundColor = .white
        secondView.layer.cornerRadius = 30
        secondView.layer.shadowRadius = 30
        secondView.layer.shadowOpacity = 0.5
        secondView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(secondView)
        
        // MARK: Constraints
        // background
        // 高度、寬度
        secondView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6).isActive = true
        secondView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        
        // 正中間
        secondView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        secondView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        // topCircle
        let topCircle = UIView()
        topCircle.backgroundColor = .white
        topCircle.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(topCircle)
        
        // 寬高 1:1 secondView寬的1/4
        topCircle.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.25).isActive = true
        /// 製作 Circle
        topCircle.heightAnchor.constraint(equalTo: topCircle.widthAnchor, multiplier: 1).isActive = true
        topCircle.layoutIfNeeded()  // 要有這一行才能取得bounds
        topCircle.layer.cornerRadius = topCircle.bounds.height * 0.5
        ///
        
        topCircle.centerXAnchor.constraint(equalTo: secondView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        topCircle.centerYAnchor.constraint(equalTo: secondView.topAnchor, constant: 0).isActive = true
        
        // merchantLogoImage
        let circleImage = UIImageView()
        circleImage.backgroundColor = .white    // variable
        circleImage.image = UIImage(named: "hivex") // payload
        circleImage.contentMode = .scaleAspectFit   // config
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        topCircle.addSubview(circleImage)
        
        circleImage.topAnchor.constraint(equalTo: topCircle.topAnchor, constant: 10.0).isActive = true
        circleImage.leadingAnchor.constraint(equalTo: topCircle.leadingAnchor, constant: 10.0).isActive = true
        circleImage.trailingAnchor.constraint(equalTo: topCircle.trailingAnchor, constant: -10.0).isActive = true
        circleImage.bottomAnchor.constraint(equalTo: topCircle.bottomAnchor, constant: -10.0).isActive = true
        circleImage.layoutIfNeeded()  // 要有這一行才能取得bounds
        circleImage.layer.cornerRadius = circleImage.bounds.height * 0.5
        
        // MARK: 上半部
        let upPartView = UIView()
        upPartView.backgroundColor = .white
        upPartView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(upPartView)
        
        upPartView.topAnchor.constraint(equalTo: topCircle.bottomAnchor).isActive = true
        upPartView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor).isActive = true
        upPartView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor).isActive = true
        NSLayoutConstraint(item: upPartView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: secondView,
                           attribute: .height,
                           multiplier: 0.5,
                           constant: 0.0).isActive = true
        
        
        // TitleLabel
        let titleLabel = UILabel()
        titleLabel.text = "SASATA CAFE"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        upPartView.addSubview(titleLabel)
        
        NSLayoutConstraint(item: titleLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: upPartView,
                           attribute: .centerY,
                           multiplier: 0.2,
                           constant: 0.0).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: upPartView.centerXAnchor).isActive = true
        
        // DateLabel
        let dateLabel = UILabel()
        dateLabel.text = "2022/01/22 11:40:56"
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        upPartView.addSubview(dateLabel)
        
        NSLayoutConstraint(item: dateLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: upPartView,
                           attribute: .centerY,
                           multiplier: 0.5,
                           constant: 0.0).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: upPartView.centerXAnchor).isActive = true
        
        // PriceLabel
        let priceLabel = UILabel()
        priceLabel.text = "1,500"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 30)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        upPartView.addSubview(priceLabel)
        
        // X、Y正中間
        priceLabel.centerYAnchor.constraint(equalTo: upPartView.centerYAnchor).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: upPartView.centerXAnchor).isActive = true
        
        // currencyLabel
        let currencyLabel = UILabel()
        currencyLabel.text = "円"
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        upPartView.addSubview(currencyLabel)
        
        NSLayoutConstraint(item: currencyLabel,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: priceLabel,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0.0).isActive = true
        currencyLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5).isActive = true
        
        // TransactionResultStatusLabel
        let transactionResultStatus = UILabel()
        transactionResultStatus.text = "支払い完了"
        transactionResultStatus.textColor = .white
        transactionResultStatus.backgroundColor = UIColor(red: 108/255, green: 182/255, blue: 117/255, alpha: 1.0)
        transactionResultStatus.textAlignment = .center
        transactionResultStatus.translatesAutoresizingMaskIntoConstraints = false
        upPartView.addSubview(transactionResultStatus)
        
        NSLayoutConstraint(item: transactionResultStatus,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: upPartView,
                           attribute: .centerY,
                           multiplier: 1.6,
                           constant: 0.0).isActive = true
        transactionResultStatus.centerXAnchor.constraint(equalTo: upPartView.centerXAnchor).isActive = true
        
        NSLayoutConstraint(
            item: transactionResultStatus,
            attribute: .width,
            relatedBy: .equal,
            toItem: upPartView,
            attribute: .width,
            multiplier: 0.5,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: transactionResultStatus,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 30).isActive = true
        
        transactionResultStatus.layoutIfNeeded()
        transactionResultStatus.layer.masksToBounds = true
        transactionResultStatus.layer.cornerRadius = transactionResultStatus.bounds.height * 0.5
        // -----
        
        let lineView = UIView()
        lineView.backgroundColor = .gray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        upPartView.addSubview(lineView)

        lineView.leadingAnchor.constraint(equalTo: upPartView.leadingAnchor, constant: 20).isActive = true
        lineView.trailingAnchor.constraint(equalTo: upPartView.trailingAnchor, constant:  -20).isActive = true
        lineView.bottomAnchor.constraint(equalTo: upPartView.bottomAnchor, constant: 0).isActive = true
        NSLayoutConstraint(item: lineView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 2).isActive = true
        
        // MARK: 下半部
        let bottomView = UIView()
        bottomView.backgroundColor = .white
        bottomView.layer.cornerRadius = 30
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(bottomView)
        
        bottomView.topAnchor.constraint(equalTo: upPartView.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: secondView.bottomAnchor).isActive = true
        
        // MARK: 左半部
        // 支払い合計Label
        let totalLabel = UILabel()
        totalLabel.text = "支払い合計"
        totalLabel.font = UIFont.systemFont(ofSize: 15)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(totalLabel)
        
        totalLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15).isActive = true
        NSLayoutConstraint(item: totalLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: bottomView,
                           attribute: .centerY,
                           multiplier: 0.5,
                           constant: 0).isActive = true
        
        // 決済番号Label
        let invoiceTitleLabel = UILabel()
        invoiceTitleLabel.text = "決済番号"
        invoiceTitleLabel.font = UIFont.systemFont(ofSize: 15)
        invoiceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(invoiceTitleLabel)
        
        invoiceTitleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15).isActive = true
        NSLayoutConstraint(item: invoiceTitleLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: bottomView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        // 支払い方法Label
        let providerTitleLabel = UILabel()
        providerTitleLabel.text = "支払い方法"
        providerTitleLabel.font = UIFont.systemFont(ofSize: 15)
        providerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(providerTitleLabel)
        
        providerTitleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15).isActive = true
        NSLayoutConstraint(item: providerTitleLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: bottomView,
                           attribute: .centerY,
                           multiplier: 1.5,
                           constant: 0).isActive = true
        
        
        // MARK: 右半部
        let totalPriceLabel = UILabel()
        totalPriceLabel.text = "1,500円"
        totalPriceLabel.font = UIFont.systemFont(ofSize: 15)
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(totalPriceLabel)
        
        totalPriceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15).isActive = true
        NSLayoutConstraint(item: totalPriceLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: bottomView,
                           attribute: .centerY,
                           multiplier: 0.5,
                           constant: 0).isActive = true
        
        let invoiceIdLabel = UILabel()
        invoiceIdLabel.text = "42738197489124237819"
        invoiceIdLabel.font = UIFont.systemFont(ofSize: 15)
        invoiceIdLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(invoiceIdLabel)
        
        invoiceIdLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15).isActive = true
        NSLayoutConstraint(item: invoiceIdLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: bottomView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        
        
        let providerLabel = UILabel()
        providerLabel.text = "PAYPAY"
        providerLabel.font = UIFont.systemFont(ofSize: 15)
        providerLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(providerLabel)
        
        providerLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15).isActive = true
        NSLayoutConstraint(item: providerLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: bottomView,
                           attribute: .centerY,
                           multiplier: 1.5,
                           constant: 0).isActive = true
        
        // Done Button
        let doneButton = UIButton()
        doneButton.setTitle("Done", for: .normal)
        doneButton.tintColor = .white
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(doneButton)
        
        doneButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        NSLayoutConstraint(item: doneButton,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 162.0).isActive = true
        
        NSLayoutConstraint(item: doneButton,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 50.0).isActive = true
        
        NSLayoutConstraint(item: doneButton,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .centerY,
                           multiplier: 1.8, constant: 0).isActive = true
        
        
        doneButton.layoutIfNeeded()
        let gradient1 = CAGradientLayer()
        let gradientStart = UIColor(red: 235/255.0, green: 78/255.0, blue: 101/255.0, alpha: 1.0)
        let gradientEnd = UIColor(red: 240/255.0, green: 149/255.0, blue: 115/255.0, alpha: 1.0)
        gradient1.colors = [gradientStart.cgColor, gradientEnd.cgColor]
        gradient1.startPoint = CGPoint(x: 0, y: 0.5)
        gradient1.endPoint = CGPoint(x: 1, y: 0.5)
        gradient1.frame = doneButton.bounds
        doneButton.layer.cornerRadius = 25
        doneButton.layer.insertSublayer(gradient1, at: 0)
        doneButton.clipsToBounds = true
    }
}

