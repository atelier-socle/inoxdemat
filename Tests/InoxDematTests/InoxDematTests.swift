import Testing
@testable import InoxDemat

struct InoxDematTests {
    @Test
    func example() async throws {
        let inoxDemat = InoxDemat("Hello, World!")
        #expect(inoxDemat.text != "Hello, World!")
    }
}
