//
//  ViewController.swift
//  Swift MVC
//
//  Created by Kan Hein on 15/02/2023.
//

import UIKit

class ViewController: UIViewController {
    var repository = BlogRepository()
    var blogs: [Blog] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "ResuableCell")
        repository.request()
    }
}

extension ViewController: UpdateBlogUIDelegate{
    func update(_ repository: BlogRepository, blogs: [Blog]) {
        self.blogs = blogs
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let blog = blogs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResuableCell", for: indexPath) as! TitleCell
        cell.title.text = blog.title
        
        DispatchQueue.global(qos: .background).async {
            let url = URL(string: blog.image)
            let data = try? Data(contentsOf: url!)
            let image: UIImage = UIImage(data: data!)!
            DispatchQueue.main.async {
                 cell.picture.image = image
            }
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
