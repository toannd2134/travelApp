//
//  CheckingViewController.swift
//  TravelApp
//
//  Created by Toan on 7/28/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia

class CheckingViewController: UIViewController {
    let headerLanbel  : UILabel  = {
        let label = UILabel()
        label.text = "Dat ve"
        label.font = UIFont.mainFont(font: .Helvetica, size: 22)
        return label
    }()
    let segmentioView : UISegmentedControl = {
      let segment = UISegmentedControl(items: ["mot chieu","khu hoi"])
        segment.selectedSegmentIndex = 0
        segment.selectedSegmentTintColor = .mainColor()
        segment.tintColor = .white
        
        return segment
    }()
    let startPointView : checkingCustomView  = {
        let view = checkingCustomView()
        view.nameViewLabel.text = "diem di"
        view.textField.placeholder = "chon dia diem"
        return view
    }()
    let endPointView : checkingCustomView  = {
           let view = checkingCustomView()
           view.nameViewLabel.text = "diem den"
           view.textField.placeholder = "chon dia diem"
           return view
       }()
    let pickLocal : UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    let pickLocal2 : UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    let dateStartPicker = UIDatePicker()
    let dateEndPicker = UIDatePicker()
    let local  = ["Ha noi" ,"Ho chi minh","da nang","vungtau"]
    let DateStartView : checkingCustomView  = {
        let view = checkingCustomView()
        view.nameViewLabel.text = "Ngay den"
        view.textField.placeholder = "chon ngay"
       
        return view
    }()
    let DateEndView : checkingCustomView  = {
           let view = checkingCustomView()
           view.nameViewLabel.text = "Ngay di"
           view.textField.placeholder = "chon ngay"
          
           return view
       }()
    let peopleView : checkingCustomView  = {
        let view = checkingCustomView()
        view.nameViewLabel.text = "so luong nguoi"
        view.textField.placeholder = "so luong"
       
       
        return view
    }()
    let payButton : UIButton = {
        let button = UIButton()
        button.setTitle("Thanh toan", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = .mainColor()
        button.addTarget(self, action: #selector(pushPay), for: .touchUpInside)
        return button
    }()
     var selectedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(title: "back", style: .done, target: self, action: nil)]
        view.backgroundColor = .white
       addsv()
        layout()
        setupPickerView()
        setupStartDatepicker()
        setupEndDatepicker()
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard1(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //đăng ký nhận thông báo khui có sự kiện ẩn bàn phím
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard1(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        startPointView.textField.delegate = self
        endPointView.textField.delegate = self
        DateStartView.textField.delegate = self
        DateEndView.textField.delegate = self
        
        
    }
    @objc func willShowKeyboard1( _ notification: NSNotification ){
           // tính kích thước bàn phím
           if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
               // nếu mà y của textField mà lớn hơn view-eight của bàn phím
               if let selectedTextField = selectedTextField {
                   if selectedTextField.frame.origin.y > view.frame.height - keyboardSize.height - selectedTextField.bounds.height {
                       
                       self.view.frame.origin.y = 0
                       // đẩy view lên một khoảng là chiều cao bàn phím
                       self.view.frame.origin.y -= keyboardSize.height
                   }
               }
           }
       }
   
       //hàm này sẽ xử lý khi ẩn bàn phím
       @objc func willHideKeyboard1(_ notification: NSNotification){
           self.view.frame.origin.y = 0
       }
    func setupEndDatepicker() {
        dateEndPicker.datePickerMode = .date
        // gan datePicker
        DateEndView.textField.inputView = dateStartPicker
        // set ngay mac dinh
        dateEndPicker.setDate(Date(), animated: true)
        let loc = Locale(identifier: "Vietnamese")
        self.dateEndPicker.locale = loc
        // setup toolbar for datepicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        let doneStartButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action:#selector(setDateEnd))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action:
            nil)
        
        // set các thành phần vào toolBar
        toolbar.setItems([cancelButton, spaceButton, doneStartButton], animated: false)
        DateEndView.textField.inputAccessoryView = toolbar
    }
    
    func setupStartDatepicker(){
        // setup datpicker
        dateStartPicker.datePickerMode = .date
        // gan datePicker
        DateStartView.textField.inputView = dateStartPicker
        // set ngay mac dinh
        dateStartPicker.setDate(Date(), animated: true)
        let loc = Locale(identifier: "Vietnamese")
        self.dateStartPicker.locale = loc
        // setup toolbar for datepicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
       
        
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(setDateStart))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action:
        nil)
        
        // set các thành phần vào toolBar
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
         DateStartView.textField.inputAccessoryView = toolbar
    }
    @objc func setDateStart() {
        DateStartView.textField.text = ConvertHelper.stringFromDate(date: dateStartPicker.date, format: "dd/MM/yyyy")
        DateEndView.textField.becomeFirstResponder()
       
    }
    @objc func setDateEnd() {
        
        DateEndView.textField.text = ConvertHelper.stringFromDate(date: dateStartPicker.date, format: "dd/MM/yyyy")
        peopleView.textField.becomeFirstResponder()
       
    }
    func setupPickerView(){
        pickLocal.delegate = self
        pickLocal.dataSource = self
        pickLocal2.delegate = self
        pickLocal2.dataSource = self
        
        startPointView.textField.inputView = pickLocal
        endPointView.textField.inputView = pickLocal2
       
        setupStartPontButton()
        setupEndPontButton()
        
    }
     func setupStartPontButton(){
        let toolbar = UIToolbar()
               
               toolbar.sizeToFit()
               let startPintBacButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(startcancelButton))
               let startpointDoneButton = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(startcomfrimButton))
               let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
               toolbar.setItems([startPintBacButton,spaceButton,spaceButton,startpointDoneButton], animated: false)
        startPointView.textField.inputAccessoryView = toolbar
    }
    func setupEndPontButton(){
        let toolbarEnd = UIToolbar()
       
        toolbarEnd.sizeToFit()
        let startPintBacButton = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(endCancelButton))
        let startpointDoneButton = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(endComfrimButton))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        toolbarEnd.setItems([startPintBacButton,spaceButton,spaceButton,startpointDoneButton], animated: false)
        endPointView.textField.inputAccessoryView = toolbarEnd
    }
    @objc func pushPay(){
     let vc  = PayViewController()
        let navigation = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func startcomfrimButton(){
//        self.view.endEditing(true)
        endPointView.textField.becomeFirstResponder()
    }
    @objc func startcancelButton () {
        startPointView.textField.text = ""
        self.view.endEditing(true)
    }
    @objc func endComfrimButton(){
        DateStartView.textField.becomeFirstResponder()
       
    }
    @objc func endCancelButton () {
        endPointView.textField.text = ""
        self.view.endEditing(true)
    }
    func addsv(){
        view.sv([headerLanbel,segmentioView,startPointView,endPointView,DateStartView,peopleView,payButton,DateEndView])
    }
    func layout(){
        view.layout(
            (self.navigationController?.navigationBar.frame.height)! + CGFloat(50),
            |-10-headerLanbel-100-| ,
            30,
            |-10-segmentioView-10-| ~ 50,
            10,
            |-10-startPointView-10-| ~ 60,
            10,
            |-10-endPointView-10-| ~ 60,
            10,
            |-10-DateStartView-10-| ~ 60,
            10,
            |-10-DateEndView-10-| ~ 60,
            10,
            |-10-peopleView-10-| ~ 60,
            30,
            |-50-payButton.centerHorizontally()-50-| ~ 50
        

    
        )
       
    }
    func setupNavigation(){
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
  

}
extension CheckingViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        local.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var   label : UILabel!
        
        if let reuseLabel = view as? UILabel {
            for i in 0...row{
                print(i)
            }
            label = reuseLabel
        } else {
            label = UILabel()
            label.textAlignment = NSTextAlignment.center
        }
        label.text = local[row]
        
        return label
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickLocal {
            startPointView.textField.text = local[row]
        }else{
            endPointView.textField.text = local[row]
        }
    }
    
    
    
}
class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let string = formatter.string(from: date)
        return string
    }
}
extension CheckingViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case startPointView.textField:
            endPointView.textField.becomeFirstResponder()
        case endPointView.textField:
            DateStartView.textField.becomeFirstResponder()
        case DateStartView.textField:
            DateEndView.textField.becomeFirstResponder()
        case DateEndView.textField :
            peopleView.textField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
           selectedTextField = textField
           return true
       }
       
       func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           print(string)
           return true
           
       }
}

