//
//  CustomTableViewCell.swift
//  Delegate and Datasource pattern
//
//  Created by Admin on 4/24/21.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapButton(with string: String)
}

class CustomTableViewCell: UITableViewCell {
    
    weak var delegate: CustomTableViewCellDelegate?
    
    static let identifier = "CustomTableViewCell"

    private let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        button.setTitle("Tap Me", for: .normal)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(didTapButton), for: .touchDown)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton() {
        guard let string = string else {
            return
        }
        delegate?.didTapButton(with: string)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 10, y: 5, width: contentView.frame.size.width - 20, height: contentView.frame.size.height - 10)
    }
    
    private var string: String?
    
    public func configure(with string: String) {
        self.string = string
    }

}
