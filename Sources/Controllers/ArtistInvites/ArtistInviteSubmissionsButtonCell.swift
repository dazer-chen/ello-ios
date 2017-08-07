////
///  ArtistInviteSubmissionsButtonCell.swift
//

import SnapKit


class ArtistInviteSubmissionsButtonCell: CollectionViewCell {
    static let reuseIdentifier = "ArtistInviteSubmissionsButtonCell"

    struct Size {
        static let margins = UIEdgeInsets(top: 0, left: 15, bottom: 60, right: 15)
        static let height: CGFloat = 40
    }

    fileprivate let submissionsButton = StyledButton(style: .artistInviteSubmissions)

    override func style() {
        submissionsButton.titleEdgeInsets.top = 4
    }

    override func bindActions() {
        submissionsButton.addTarget(self, action: #selector(tappedSubmissionsButton), for: .touchUpInside)
    }

    override func setText() {
        submissionsButton.title = InterfaceString.ArtistInvites.SeeSubmissions
    }

    override func arrange() {
        contentView.addSubview(submissionsButton)

        submissionsButton.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.trailing.equalTo(contentView).inset(Size.margins)
            make.height.equalTo(Size.height)
        }
    }
}

extension ArtistInviteSubmissionsButtonCell {
    @objc
    func tappedSubmissionsButton() {
        let responder: ArtistInviteResponder? = findResponder()
        responder?.tappedArtistInviteSubmissionsButton()
    }
}

extension StyledButton.Style {
    static let artistInviteSubmissions = StyledButton.Style(
        backgroundColor: .white, highlightedBackgroundColor: .greenD1,
        titleColor: .greenD1, highlightedTitleColor: .white,
        borderColor: .greenD1, highlightedBorderColor: .white,
        cornerRadius: .rounded
        )
}