////
////  CharacterMapTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//class CharacterMapperTest: XCTestCase {
//    
//    var characterMapper: CharacterMapper!
//    
//    override func setUp() {
//        super.setUp()
//        characterMapper = CharacterMapper()
//    }
//    
//    override func tearDown() {
//        characterMapper = nil
//        super.tearDown()
//    }
//    
//    func testToCharacterDTO() {
//        let characterData =
//            MobileDevelopmentChallenge.CharacterData(id: "1", name: "Test Character", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        
//        let expectedDTO = CharacterDTO(character: characterData)
//        
//        let resultDTO = characterMapper.toCharacterDTO(character: characterData)
//        
//        XCTAssertEqual(resultDTO, expectedDTO)
//    }
//    
//    func testToCharactersDTO() {
//        let characterData1 =
//            MobileDevelopmentChallenge.CharacterData(id: "1", name: "Test Character 1", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        let characterData2 = MobileDevelopmentChallenge.CharacterData(id: "2", name: "Test Character 2", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//
//        let charactersData = [characterData1, characterData2]
//        
//        let expectedDTO1 = CharacterDTO(character: characterData1)
//        let expectedDTO2 = CharacterDTO(character: characterData2)
//        
//        let resultDTOs = characterMapper.toCharactersDTO(characters: charactersData)
//        
//        XCTAssertEqual(resultDTOs.count, 2)
//        XCTAssertEqual(resultDTOs[0], expectedDTO1)
//        XCTAssertEqual(resultDTOs[1], expectedDTO2)
//    }
//    
//    func testToCharactersDTO_EmptyArray() {
//        let charactersData: [CharacterData] = []
//        
//        let resultDTOs = characterMapper.toCharactersDTO(characters: charactersData)
//        
//        XCTAssertEqual(resultDTOs.count, 0)
//    }
//}
//
