//
//  ViewController.swift
//  UISwitch
//
//  Created by MacBook on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    let mySwitch = UISwitch()
    //Для примера функционала создадим кнопку
    let myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Создаем кнопку по координатам и размеру
        self.myButton.frame = CGRect(x: 110, y: 500, width: 200, height: 50)
        self.view.addSubview(self.myButton)
        //Закругляем углы у кнопки
        self.myButton.layer.cornerRadius = 12
        //Меняем цвет кнопки
        self.myButton.backgroundColor = UIColor.black
        //Меняем цвет текста в обычном положении
        self.myButton.setTitleColor(UIColor.systemGreen, for: .normal)
        //Меняем цвет текста в нажатом положении
        self.myButton.setTitleColor(UIColor.systemRed, for: .highlighted)
        //Название текста в обычном положении
        self.myButton.setTitle("Hello World", for: .normal)
        //Название текста в нажатом положении
        self.myButton.setTitle("Кнопка нажата", for: .highlighted)
        
        //Создаем Switch по центру экрана
        self.mySwitch.frame = CGRect.zero
        self.mySwitch.center = self.view.center
        self.view.addSubview(self.mySwitch)
        //Меняем цвет рычажка переключения
        self.mySwitch.thumbTintColor = UIColor.systemYellow
        //Меняем цвет в положении Вкл
        self.mySwitch.onTintColor = UIColor.systemRed
        //Положение ползунка по умолчанию Вкл
        self.mySwitch.setOn(true, animated: true)
        
        //Проверка на Вкл/Выкл
        if self.mySwitch.isOn{
            print("Switch ON")
        } else {
            print("Switch OFF")
        }
        self.mySwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
        
        //При включенном Switch кнопка не нажимается
        self.mySwitch.addTarget(self, action: #selector(isOnSwitch(target:)), for: .valueChanged)
    }
    //Функция проверки на Вкл/Выкл
    @objc func switchChange(paramTarget: UISwitch) {
        print("param is = ", paramTarget)
        if paramTarget .isOn{
            print("Switch ON")
        } else {
            print("Switch OFF")
        }
    }
    //Функция, при включенном Switch кнопка не нажимается
    @objc func isOnSwitch(target: UISwitch) {
        if target .isOn {
            self.myButton.isUserInteractionEnabled = false
        } else {
            self.myButton.isUserInteractionEnabled = true
        }
    }
}

