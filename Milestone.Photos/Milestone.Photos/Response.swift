import Foundation

struct Response: Codable {
    let id: String?
    let createdAt, updatedAt, promotedAt: Date?
    let width, height: Int?
    let color: String?
    let welcomeDescription: String?
    let altDescription: String?
    let urls: URLs?
    let links: WelcomeLinks?
    let categories: [String]?
    let likes: Int?
    let likedByUser: Bool?
    let currentUserCollections: [String]?
    let sponsorship: String?
    let user: User?
    let exif: Exif?
    let location: Location?
    let views, downloads: Int?
}

struct Exif: Codable {
    let make, model, exposureTime, aperture: String?
    let focalLength: String?
    let iso: Int?
}

struct WelcomeLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?
}

struct Location: Codable {
    let title, name: String?
    let city: String?
    let country: String?
    let position: Position?
}

struct Position: Codable {
    let latitude, longitude: Double?
}

struct URLs: Codable {
    let raw, full, regular, small: String?
    let thumb: String?
}

struct User: Codable {
    let id: String?
    let updatedAt: Date?
    let username, name, firstName, lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos: Bool?
}

struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?
}

struct ProfileImage: Codable {
    let small, medium, large: String?
}
