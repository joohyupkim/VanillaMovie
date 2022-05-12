//
//  ViewController.swift
//  SimpleMovie
//
//  Created by pineone on 2022/05/12.
//

import UIKit

/*
 기본적으로 VC에 UINavigationItem(navigationItem)이 있다.
 */

class MainViewController: UIViewController {
    
    // MARK: - View
    private lazy var rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTap))
    
    private lazy var naviBarAppear = UINavigationBarAppearance().then {
        $0.backgroundColor = .clear // .gray
    }
    
    lazy var searchController = UISearchController(searchResultsController: SearchResultViewController()).then {
        $0.searchBar.autocapitalizationType = .none
        $0.searchBar.searchTextField.placeholder = "최소 평점을 입력하세요 (0~9)"
        $0.searchBar.returnKeyType = .done
    }
    
    private lazy var tableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
    }
    
    private lazy var button = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setNaviBar()
    }
    
    
    // MARK: - Method
    private func setNaviBar(isSearch: Bool = true) {
        if isSearch {
            setSearchController()
        } else {
            title = "홈"
            navigationItem.rightBarButtonItem = rightButton
        }
        
        
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        view.addSubviews([tableView, button])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setSearchController() {
        navigationItem.title = "Movie"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        definesPresentationContext = true

    }
    
    @objc
    func addTap() {
        print("Add Tap")
    }
    
    @objc fileprivate func goToProfileVC(){
        let vc = UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.text = "dsdsd"
    }
}

extension MainViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
}
