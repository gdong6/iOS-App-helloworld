//
//  ViewController.swift
//  random
//
//  Created by GUOXUAN DONG on 3/16/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Random Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y:0, width: 400, height: 400)
        imageView.center = view.center
        getRandomImage()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomImage()
        //view.backgroundColor = colors.randomElement()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 50
        )
    }
    func getRandomImage (){
        let urlPath = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlPath)!
        guard let data = try? Data(contentsOf: url) else{ return }
        imageView.image = UIImage(data: data)
    }
}

