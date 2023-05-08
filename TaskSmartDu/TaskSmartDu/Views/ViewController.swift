//
//  ViewController.swift
//  TaskSmartDu
//
//  Created by Satham Hussain on 08/05/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()

    static let identifier = "NYNewsCell"
    var newsVM = NYViewModel()
    var isNetworkAvailable: Bool {
        if ReachabilityManager.isConnectedToNetwork() {
            return true
        }else{
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPageTitle()
        setupTableView()
        fetchNews()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: ViewController.identifier, bundle: nil), forCellReuseIdentifier: ViewController.identifier)
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    func setPageTitle() {
        self.navigationItem.title = "NY Times"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func fetchNews() {
        if !isNetworkAvailable{
            self.alert(message: "No network available, try again later", title: "Network Error")
            if self.refreshControl.isRefreshing {
                stopRefresh()
            }
            self.tableView.reloadData()
        }else{
            
            Task.init{
                await newsVM.fetchNews ()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsVM.newsData?.results?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NYNewsCell = tableView.dequeueReusableCell(withIdentifier: ViewController.identifier) as! NYNewsCell
        let newsItem = newsVM.newsData?.results?[indexPath.row]
        cell.configure(model: newsItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller = getDetailVC() else { return }
        controller.model = newsVM.newsData?.results?[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension ViewController {
    func getDetailVC() -> NewsDetailViewController? {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController {
            return controller
        }
        return nil
    }
    
    @objc private func refreshData() {
        // Load data
        fetchNews()
        // Stop the refresh control animation
       stopRefresh()
    }
    func stopRefresh(){
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            UIView.animate(withDuration: 0.5, animations: {
                self.tableView.contentOffset = CGPoint.zero
            })
        }
    }
}
