//
//  ViewController.swift
//  ios-swinject-storyboard-demo
//
//  Created by Kushida　Eiji on 2017/03/09.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class ViewController: UIViewController {
    
    let container = Container()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDI()
    }

    ///AnimalViewControllerにCatオブジェクト(Animalプロトコル)と関連付ける
    private func setupDI() {
        container.register(Animal.self) { _ in Cat(name: "Mer") }
        container.storyboardInitCompleted(AnimalViewController.self) { r, c in
            c.animal = r.resolve(Animal.self)
        }
    }
    
    //MARK:-IBAction
    @IBAction func didTapButton(_ sender: UIButton) {
        
        let sb = SwinjectStoryboard.create(name: "Main",
                                           bundle: nil,
                                           container: container)
        
        let vc = sb.instantiateViewController(withIdentifier: "AnimalViewController")
            as! AnimalViewController
        
        self.present(vc, animated: true, completion: nil)
    }
}
