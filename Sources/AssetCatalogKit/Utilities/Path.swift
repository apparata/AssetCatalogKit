//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// Represents a file system path.
///
/// - Example:
/// ```
/// let absolutePath = Path("/usr/bin/zip")
/// absolutePath.isAbsolute
/// absolutePath.isRelative
///
/// let relativePath = Path("bin/whatever")
/// relativePath.isAbsolute
/// relativePath.isRelative
///
/// let concatenatedPath = Path("/usr") + Path("/bin")
///
/// let messyPath = Path("//usr/../usr/local/bin/./whatever")
/// messyPath.normalized
///
/// let pathFromLiteralString: Path = "/this/is/a/path"
/// let pathFromEmptyString: Path = ""
/// let pathFromConcatenatedStrings: Path = "/usr" + "/bin"
///
/// let pathFromComponents = Path(components: ["/", "usr/", "bin", "/", "swift"])
/// let pathFromEmptyComponents = Path(components: [])
///
/// let appendedPath = Path("/usr/local").appendingComponent("bin")
/// let appendedPath3 = Path("/usr/local").appending(Path("bin"))
/// let appendedPath2 = Path("/usr/local") + Path("bin")
///
/// let imagePath = Path("photos/photo").appendingExtension("jpg")
/// imagePath.extension
///
/// let imagePathWithoutExtension = imagePath.deletingExtension
/// let imagePathWithoutLastComponent = imagePath.deletingLastComponent
///
/// absolutePath.exists
/// absolutePath.isFile
/// absolutePath.isDirectory
/// absolutePath.isDeletable
/// absolutePath.isExecutable
/// absolutePath.isReadable
/// absolutePath.isWritable
/// ```
struct Path: Codable {
    
    fileprivate var path: String
    
    var internalPath: String {
        path
    }
        
    var isAbsolute: Bool {
        path.first == "/"
    }
    
    var isRelative: Bool {
        !isAbsolute
    }
    
    var normalized: Path {
        Path((path as NSString).standardizingPath)
    }
    
    var string: String {
        path
    }
    
    var url: URL {
        URL(fileURLWithPath: path)
    }
    
    init() {
        path = "."
    }
    
    init(_ path: String) {
        if path.isEmpty {
            self.path = "."
        } else {
            self.path = path
        }
    }
    
    func appending(_ path: Path) -> Path {
        Path((self.path as NSString).appendingPathComponent(path.path))
    }
    
    init<T: Collection>(components: T) where T.Iterator.Element == String {
        if components.isEmpty {
            path = "."
        } else {
            let strings: [String] = components.map { $0 }
            path = NSString.path(withComponents: strings)
        }
    }
    
    var lastComponent: String {
        (path as NSString).lastPathComponent
    }
    
    var deletingLastComponent: Path {
        Path((path as NSString).deletingLastPathComponent)
    }
    
    func appendingComponent(_ string: String) -> Path {
        Path((path as NSString).appendingPathComponent(string))
    }
    
    func replacingLastComponent(with string: String) -> Path {
        deletingLastComponent.appendingComponent(string)
    }
    
    var `extension`: String {
        (path as NSString).pathExtension
    }
    
    var deletingExtension: Path {
        Path((path as NSString).deletingPathExtension)
    }
    
    func appendingExtension(_ string: String) -> Path {
        guard let newPath = (path as NSString).appendingPathExtension(string) else {
            // Not sure what could cause it to be nil, so here's a fallback plan.
            return Path(path + "." + string)
        }
        return Path(newPath)
    }
    
    func replacingExtension(with string: String) -> Path {
        deletingExtension.appendingExtension(string)
    }
}

// MARK: - Object Description

extension Path: CustomStringConvertible {
    var description: String {
        path
    }
}

// MARK: - String Literal Convertible

extension Path: ExpressibleByStringLiteral {
    typealias UnicodeScalarLiteralType = StringLiteralType
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    
    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        path = "\(value)"
        if path.isEmpty {
            path = "."
        }
    }
    
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        path = value
        if path.isEmpty {
            path = "."
        }
    }
    
    init(stringLiteral value: StringLiteralType) {
        path = value
        if path.isEmpty {
            path = "."
        }
    }
}

// MARK: - Hashable, Equatable, Comparable

extension Path: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(path)
    }
}

extension Path: Equatable {
    
    static func ==(lhs: Path, rhs: Path) -> Bool {
        lhs.path == rhs.path
    }
}

extension Path : Comparable {
 
    static func <(lhs: Path, rhs: Path) -> Bool {
        lhs.path < rhs.path
    }
}

// MARK: - Concatenation

func +(lhs: Path, rhs: Path) -> Path {
    lhs.appending(rhs)
}

func +(lhs: Path, rhs: String) -> Path {
    lhs.appendingComponent(rhs)
}

// MARK: - File Management

extension Path {
    
    fileprivate static var fileManager: FileManager {
        FileManager.default
    }
    
    fileprivate var fileManager: FileManager {
        FileManager.default
    }
    
    /// Note: No-op if file does not exist.
    func excludeFromBackup() throws {
        guard exists else {
            return
        }
        
        let mutableURL: NSURL = url as NSURL
        
        try mutableURL.setResourceValue(true, forKey: URLResourceKey.isExcludedFromBackupKey)
    }
    
    var exists: Bool {
        fileManager.fileExists(atPath: internalPath)
    }
    
    var doesNotExist: Bool {
        !exists
    }
    
    var isFile: Bool {
        !isDirectory
    }
    
    var isDirectory: Bool {
        var isDirectory = ObjCBool(false)
        if fileManager.fileExists(atPath: internalPath, isDirectory: &isDirectory) {
            return isDirectory.boolValue
        }
        return false
    }
    
    var isDeletable: Bool {
        fileManager.isDeletableFile(atPath: internalPath)
    }
    
    var isExecutable: Bool {
        fileManager.isExecutableFile(atPath: internalPath)
    }
    
    var isReadable: Bool {
        fileManager.isReadableFile(atPath: internalPath)
    }
    
    var isWritable: Bool {
        fileManager.isWritableFile(atPath: internalPath)
    }
    
    func contentsOfDirectory(fullPaths: Bool = false) throws -> [Path] {
        let pathStrings = try fileManager.contentsOfDirectory(atPath: internalPath)
        let paths: [Path]
        if fullPaths {
            paths = pathStrings.map {
                self.appendingComponent($0)
            }
        } else {
            paths = pathStrings.map {
                Path($0)
            }
        }
        return paths
    }

    func recursiveContentsOfDirectory(fullPaths: Bool = false) throws -> [Path] {
        let pathStrings = try fileManager.subpathsOfDirectory(atPath: internalPath)
        let paths: [Path]
        if fullPaths {
            paths = pathStrings.map {
                self.appendingComponent($0)
            }
        } else {
            paths = pathStrings.map {
                Path($0)
            }
        }
        return paths
    }

    static var currentDirectory: Path {
        Path(fileManager.currentDirectoryPath)
    }
    
    static var homeDirectory: Path {
        Path(NSHomeDirectory())
    }
    
    static var temporaryDirectory: Path {
        Path(NSTemporaryDirectory())
    }
            
    static var documentDirectory: Path? {
        if let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last {
            return Path(documentDirectory)
        } else {
            return nil
        }
    }
    
    static var cachesDirectory: Path? {
        if let directory = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last {
            return Path(directory)
        } else {
            return nil
        }
    }
    
    /// The application support directory typically does not exist at first.
    /// You need to create it if it doesn't exist. The getter of this variable
    /// will try to append the app bundle identifier to the path as recommended
    /// by Apple.
    static var applicationSupportDirectory: Path? {
        if let directory = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).last {
            var appSupportPath = Path(directory)
            if let bundleIdentifier = Bundle.main.bundleIdentifier {
                appSupportPath = appSupportPath.appendingComponent(bundleIdentifier)
            }
            return appSupportPath
        } else {
            return nil
        }
    }
    
    static var downloadsDirectory: Path? {
        if let documentDirectory = NSSearchPathForDirectoriesInDomains(.downloadsDirectory, .userDomainMask, true).last {
            return Path(documentDirectory)
        } else {
            return nil
        }
    }
    
    static var desktopDirectory: Path? {
        if let documentDirectory = NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true).last {
            return Path(documentDirectory)
        } else {
            return nil
        }
    }
    
    static var applicationsDirectory: Path? {
        if let documentDirectory = NSSearchPathForDirectoriesInDomains(.applicationDirectory, .userDomainMask, true).last {
            return Path(documentDirectory)
        } else {
            return nil
        }
    }
    
    func becomeCurrentDirectory() {
        fileManager.changeCurrentDirectoryPath(internalPath)
    }
    
    func createDirectory(withIntermediateDirectories createIntermediateDirectories: Bool = true, attributes: [FileAttributeKey: Any]? = nil) throws {
        try fileManager.createDirectory(at: URL(fileURLWithPath: internalPath, isDirectory: true), withIntermediateDirectories: createIntermediateDirectories, attributes: attributes)
    }
    
    func remove() throws {
        try fileManager.removeItem(at: url)
    }
    
    func copy(to toPath: Path) throws {
        try fileManager.copyItem(atPath: internalPath, toPath: toPath.internalPath)
    }

    func copy(to toPath: String) throws {
        try fileManager.copyItem(atPath: internalPath, toPath: toPath)
    }
    
    func copy(to toURL: URL) throws {
        try fileManager.copyItem(at: url, to: toURL)
    }
    
    func move(to toPath: Path) throws {
        try fileManager.moveItem(atPath: internalPath, toPath: toPath.internalPath)
    }

    func move(to toPath: String) throws {
        try fileManager.moveItem(atPath: internalPath, toPath: toPath)
    }

    func move(to toURL: URL) throws {
        try fileManager.moveItem(at: url, to: toURL)
    }

    func safeReplace(withItemAt itemPath: Path) throws -> URL? {
        let resultingURL = try fileManager.replaceItemAt(url,
                                                         withItemAt: itemPath.url,
                                                         backupItemName: itemPath.url.lastPathComponent + ".safeReplaceBackup",
                                                         options: .usingNewMetadataOnly)
        return resultingURL
    }
    
    /// Set POSIX file permissions. Same as chmod. Octal number is recommended.
    func setPosixPermissions(_ permissions: Int) throws {
        try fileManager.setAttributes([.posixPermissions: permissions],
                                      ofItemAtPath: internalPath)
    }
}
