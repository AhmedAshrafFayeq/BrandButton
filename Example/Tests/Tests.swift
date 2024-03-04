import XCTest
import BrandButton

class Tests: XCTestCase {
    
    var customBrandButton: CustomBrandButton!
    
    override func setUp() {
        super.setUp()
        customBrandButton = CustomBrandButton()
    }
    
    override func tearDown() {
        customBrandButton = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(customBrandButton)
    }
    
    func testTypeSetting() {
        customBrandButton.type = .primary
        XCTAssertEqual(customBrandButton.type, .primary)
        customBrandButton.type = .secondary
        XCTAssertEqual(customBrandButton.type, .secondary)
    }
    
    func testColorStyleSetting() {
        customBrandButton.colorStyle = .green
        XCTAssertEqual(customBrandButton.colorStyle, .green)
        customBrandButton.colorStyle = .blue
        XCTAssertEqual(customBrandButton.colorStyle, .blue)
    }
    
    func testFontSetting() {
        let font = UIFont.systemFont(ofSize: 16)
        customBrandButton.font = font
        XCTAssertEqual(customBrandButton.font, font)
    }
    
    func testTitleSetting() {
        let title = "Test Title"
        customBrandButton.title = title
        XCTAssertEqual(customBrandButton.title, title)
    }
    
}
