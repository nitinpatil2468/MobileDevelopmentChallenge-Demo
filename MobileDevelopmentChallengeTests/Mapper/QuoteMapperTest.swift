//
//  QuoteMapperTest.swift
//  MobileDevelopmentChallengeTests
//
//  Created by capgemini on 28/01/25.
//

import Foundation

import XCTest
@testable import MobileDevelopmentChallenge

class QuoteMapperTest: XCTestCase {
    
    var quoteMapper: QuoteMapper!
    
    override func setUp() {
        super.setUp()
        quoteMapper = QuoteMapper()
    }
    
    override func tearDown() {
        quoteMapper = nil
        super.tearDown()
    }
    
//    func testToQuoteDTO() {
//        let quoteData = QuoteData(id: "2", dialog: "I'll be back.", movie: "Terminator", character: "Terminator", docID: "2")
//        let expectedDTO = QuoteDto(quote: quoteData)
//       
//        let resultDTO = quoteMapper.toQuoteDTO(quote: quoteData)
//       
//        XCTAssertEqual(resultDTO, expectedDTO)
//    }
//    
//    func testToQuotesDTO() {
//        let quoteData1 = QuoteData(id: "1", dialog: "ok", movie: "Terminator", character: "Terminator", docID: "2")
//        let quoteData2 = QuoteData(id: "2", dialog: "by", movie: "Terminator", character: "Terminator", docID: "2")
//        let quotesData = [quoteData1, quoteData2]
//        
//        let expectedDTO1 = QuoteDto(quote: quoteData1)
//        let expectedDTO2 = QuoteDto(quote: quoteData2)
//        
//        let resultDTOs = quoteMapper.toQuotesDTO(quotes: quotesData)
//        
//        XCTAssertEqual(resultDTOs.count, 2)
//        XCTAssertEqual(resultDTOs[0], expectedDTO1)
//        XCTAssertEqual(resultDTOs[1], expectedDTO2)
//    }
    
    func testToQuotesDTO_EmptyArray() {
        let quotesData: [QuoteData] = []
        
        let resultDTOs = quoteMapper.toQuotesDTO(quotes: quotesData)
        
        XCTAssertEqual(resultDTOs.count, 0)
    }
}
