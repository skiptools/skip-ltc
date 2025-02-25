// SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception
import XCTest
import Foundation
import OSLog
@testable import SkipLTC
import SkipFFI

fileprivate let logger: Logger = Logger(subsystem: "test", category: "SkipLTC")

fileprivate let lib: AlgorithmsLibrary = AlgorithmsLibrary.shared

final class AlgorithmsTest: XCTestCase {
    func testSHA256() throws {
        let state: HashPointer = createHashPointer()
        defer {
            #if SKIP
            state.close()
            #else
            state.deallocate()
            #endif
        }
        let initResult = lib.sha256_init(state: state)
        XCTAssertEqual(0, initResult)

        let data = Data("Hello World".utf8)
        let len = Int64(data.count)
        let processResult = data.withUnsafeBytes { ptr in
             lib.sha256_process(state: state, data: ptr, len: len)
        }
        XCTAssertEqual(0, processResult)

        #if SKIP
        throw XCTSkip("need more SkipFFI Data support")
        #else
        var hash = Data(count: 32)
        let doneResult = hash.withUnsafeMutableBytes { ptr in
            lib.sha256_done(state: state, data: ptr)
        }
        XCTAssertEqual(0, doneResult)

        XCTAssertEqual("a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e", hash.hex())
        #endif
    }
    
    func testAlgorithms() throws {
        XCTAssertEqual(0, lib.safer_k64_test())
        XCTAssertEqual(0, lib.safer_sk64_test())
        XCTAssertEqual(0, lib.safer_sk128_test())
        XCTAssertEqual(0, lib.saferp_test())
        XCTAssertEqual(0, lib.twofish_test())
        XCTAssertEqual(0, lib.anubis_test())
        XCTAssertEqual(0, lib.blowfish_test())
        XCTAssertEqual(0, lib.camellia_test())
        XCTAssertEqual(0, lib.cast5_test())
        XCTAssertEqual(0, lib.des_test())
        XCTAssertEqual(0, lib.des3_test())
        XCTAssertEqual(0, lib.idea_test())
        XCTAssertEqual(0, lib.kasumi_test())
        XCTAssertEqual(0, lib.khazad_test())
        XCTAssertEqual(0, lib.kseed_test())
        XCTAssertEqual(0, lib.multi2_test())
        XCTAssertEqual(0, lib.noekeon_test())
        XCTAssertEqual(0, lib.rc2_test())
        XCTAssertEqual(0, lib.rc5_test())
        XCTAssertEqual(0, lib.rc6_test())
        XCTAssertEqual(0, lib.serpent_test())
        XCTAssertEqual(0, lib.skipjack_test())
        XCTAssertEqual(0, lib.tea_test())
        XCTAssertEqual(0, lib.xtea_test())
        XCTAssertEqual(0, lib.chacha20poly1305_test())
        XCTAssertEqual(0, lib.sha224_test())
        XCTAssertEqual(0, lib.sha256_test())
        XCTAssertEqual(0, lib.sha384_test())
        XCTAssertEqual(0, lib.sha512_224_test())
        XCTAssertEqual(0, lib.sha512_256_test())
        XCTAssertEqual(0, lib.sha512_test())
        XCTAssertEqual(0, lib.whirlpool_test())
        XCTAssertEqual(0, lib.blake2b_512_test())
        XCTAssertEqual(0, lib.blake2b_384_test())
        XCTAssertEqual(0, lib.blake2b_256_test())
        XCTAssertEqual(0, lib.blake2b_160_test())
        XCTAssertEqual(0, lib.blake2s_256_test())
        XCTAssertEqual(0, lib.blake2s_224_test())
        XCTAssertEqual(0, lib.blake2s_160_test())
        XCTAssertEqual(0, lib.blake2s_128_test())
        XCTAssertEqual(0, lib.md2_test())
        XCTAssertEqual(0, lib.md4_test())
        XCTAssertEqual(0, lib.md5_test())
        XCTAssertEqual(0, lib.rmd128_test())
        XCTAssertEqual(0, lib.rmd160_test())
        XCTAssertEqual(0, lib.rmd256_test())
        XCTAssertEqual(0, lib.rmd320_test())
        XCTAssertEqual(0, lib.sha1_test())
        XCTAssertEqual(0, lib.sha3_224_test())
        XCTAssertEqual(0, lib.sha3_256_test())
        XCTAssertEqual(0, lib.sha3_384_test())
        XCTAssertEqual(0, lib.sha3_512_test())
        XCTAssertEqual(0, lib.sha3_shake_test())
        XCTAssertEqual(0, lib.keccak_224_test())
        XCTAssertEqual(0, lib.keccak_256_test())
        XCTAssertEqual(0, lib.keccak_384_test())
        XCTAssertEqual(0, lib.keccak_512_test())
        XCTAssertEqual(0, lib.tiger_test())
        XCTAssertEqual(0, lib.blake2bmac_test())
        XCTAssertEqual(0, lib.blake2smac_test())
        XCTAssertEqual(0, lib.pelican_test())
        XCTAssertEqual(0, lib.poly1305_test())
        XCTAssertEqual(0, lib.adler32_test())
        XCTAssertEqual(0, lib.crc32_test())
        XCTAssertEqual(0, lib.chacha20_prng_test())
        XCTAssertEqual(0, lib.fortuna_test())
        XCTAssertEqual(0, lib.rc4_test())
        XCTAssertEqual(0, lib.sober128_test())
        XCTAssertEqual(0, lib.sprng_test())
        XCTAssertEqual(0, lib.yarrow_test())
        XCTAssertEqual(0, lib.chacha_test())
        XCTAssertEqual(0, lib.rabbit_test())
        XCTAssertEqual(0, lib.rc4_stream_test())
        XCTAssertEqual(0, lib.salsa20_test())
        XCTAssertEqual(0, lib.xsalsa20_test())
        XCTAssertEqual(0, lib.sober128_stream_test())
        XCTAssertEqual(0, lib.sosemanuk_test())

        //XCTAssertEqual(0, lib.ccm_test())
        //XCTAssertEqual(0, lib.eax_test())
        //XCTAssertEqual(0, lib.gcm_test())
        //XCTAssertEqual(0, lib.ocb_test())
        //XCTAssertEqual(0, lib.ocb3_test())
        //XCTAssertEqual(0, lib.chc_test())
        //XCTAssertEqual(0, lib.f9_test())
        //XCTAssertEqual(0, lib.hmac_test())
        //XCTAssertEqual(0, lib.omac_test())
        //XCTAssertEqual(0, lib.pmac_test())
        //XCTAssertEqual(0, lib.xcbc_test())
        //XCTAssertEqual(0, lib.hkdf_test())
        //XCTAssertEqual(0, lib.ctr_test())
        //XCTAssertEqual(0, lib.lrw_test())
        //XCTAssertEqual(0, lib.xts_test())

    }
}

extension Sequence where Element == UInt8 {
    /// Convert this sequence of bytes into a hex string
    public func hex() -> String { map { String(format: "%02x", $0) }.joined() }
}
