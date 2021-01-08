//
//  ViewController.swift
//  DisposeBagDemo
//
//  Created by Ahmed M. Hassan on 08/01/2021.
//

import UIKit

// MARK: - ViewController
//
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func didTapButton(_ sender: Any) {
    present(SecondViewController(), animated: true, completion: nil)
  }
}

// MARK: - SecondViewController
//
class SecondViewController: UIViewController {
  
  let disposeBag = DisposeBag()

  let viewModel = ViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.subject.subscribe { [weak self] value in
      self?.doSomething(value)
    }.disposed(by: disposeBag)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  func doSomething(_ value: Any) {
    print(value)
  }
  
  deinit {
    print(#function, self)
  }
}

// MARK: - ViewModel
//
class ViewModel {
  
  let subject = PublishSubject<Bool>()
}
