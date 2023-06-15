//
//  ViewController.swift
//  TestFramework
//
//  Created by Truong on 15/06/2023.
//

import UIKit
import TestCreateSDK

class ViewController: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting..."
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemPink
        label.textAlignment = .center
        return label
    }()
    
    private lazy var handleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        button.setTitle("Connect", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.backgroundColor = .green
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
    }
    
    private func setupConstraint() {
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.addSubview(resultLabel)
        contentView.addSubview(handleButton)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            resultLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            handleButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            handleButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            handleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            handleButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Objc Functions
    @objc private func handleButtonTapped() {
        resultLabel.text = "Connected!"
        let result = TestCreateSDK.add(3, with: 4)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.resultLabel.text = "\(result)"            
        }
    }
}

