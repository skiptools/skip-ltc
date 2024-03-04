// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

import Foundation
import SkipFFI
#if !SKIP
import LibTomCrypt
#endif

internal final class AlgorithmsLibrary {
    static let shared = registerNatives(AlgorithmsLibrary(), frameworkName: "SkipLTC", libraryName: "tomcrypt")

    // MARK: Self-test functions

    /* SKIP EXTERN */ public func safer_k64_test() -> Int32 { LibTomCrypt.safer_k64_test() }
    /* SKIP EXTERN */ public func safer_sk64_test() -> Int32 { LibTomCrypt.safer_sk64_test() }
    /* SKIP EXTERN */ public func safer_sk128_test() -> Int32 { LibTomCrypt.safer_sk128_test() }
    /* SKIP EXTERN */ public func saferp_test() -> Int32 { LibTomCrypt.saferp_test() }
    /* SKIP EXTERN */ public func twofish_test() -> Int32 { LibTomCrypt.twofish_test() }
    /* SKIP EXTERN */ public func anubis_test() -> Int32 { LibTomCrypt.anubis_test() }
    /* SKIP EXTERN */ public func blowfish_test() -> Int32 { LibTomCrypt.blowfish_test() }
    /* SKIP EXTERN */ public func camellia_test() -> Int32 { LibTomCrypt.camellia_test() }
    /* SKIP EXTERN */ public func cast5_test() -> Int32 { LibTomCrypt.cast5_test() }
    /* SKIP EXTERN */ public func des_test() -> Int32 { LibTomCrypt.des_test() }
    /* SKIP EXTERN */ public func des3_test() -> Int32 { LibTomCrypt.des3_test() }
    /* SKIP EXTERN */ public func idea_test() -> Int32 { LibTomCrypt.idea_test() }
    /* SKIP EXTERN */ public func kasumi_test() -> Int32 { LibTomCrypt.kasumi_test() }
    /* SKIP EXTERN */ public func khazad_test() -> Int32 { LibTomCrypt.khazad_test() }
    /* SKIP EXTERN */ public func kseed_test() -> Int32 { LibTomCrypt.kseed_test() }
    /* SKIP EXTERN */ public func multi2_test() -> Int32 { LibTomCrypt.multi2_test() }
    /* SKIP EXTERN */ public func noekeon_test() -> Int32 { LibTomCrypt.noekeon_test() }
    /* SKIP EXTERN */ public func rc2_test() -> Int32 { LibTomCrypt.rc2_test() }
    /* SKIP EXTERN */ public func rc5_test() -> Int32 { LibTomCrypt.rc5_test() }
    /* SKIP EXTERN */ public func rc6_test() -> Int32 { LibTomCrypt.rc6_test() }
    /* SKIP EXTERN */ public func serpent_test() -> Int32 { LibTomCrypt.serpent_test() }
    /* SKIP EXTERN */ public func skipjack_test() -> Int32 { LibTomCrypt.skipjack_test() }
    /* SKIP EXTERN */ public func tea_test() -> Int32 { LibTomCrypt.tea_test() }
    /* SKIP EXTERN */ public func xtea_test() -> Int32 { LibTomCrypt.xtea_test() }
    /* SKIP EXTERN */ public func ccm_test() -> Int32 { LibTomCrypt.ccm_test() }
    /* SKIP EXTERN */ public func chacha20poly1305_test() -> Int32 { LibTomCrypt.chacha20poly1305_test() }
    /* SKIP EXTERN */ public func eax_test() -> Int32 { LibTomCrypt.eax_test() }
    /* SKIP EXTERN */ public func gcm_test() -> Int32 { LibTomCrypt.gcm_test() }
    /* SKIP EXTERN */ public func ocb_test() -> Int32 { LibTomCrypt.ocb_test() }
    /* SKIP EXTERN */ public func ocb3_test() -> Int32 { LibTomCrypt.ocb3_test() }
    /* SKIP EXTERN */ public func chc_test() -> Int32 { LibTomCrypt.chc_test() }
    /* SKIP EXTERN */ public func sha224_test() -> Int32 { LibTomCrypt.sha224_test() }
    /* SKIP EXTERN */ public func sha256_test() -> Int32 { LibTomCrypt.sha256_test() }
    /* SKIP EXTERN */ public func sha384_test() -> Int32 { LibTomCrypt.sha384_test() }
    /* SKIP EXTERN */ public func sha512_224_test() -> Int32 { LibTomCrypt.sha512_224_test() }
    /* SKIP EXTERN */ public func sha512_256_test() -> Int32 { LibTomCrypt.sha512_256_test() }
    /* SKIP EXTERN */ public func sha512_test() -> Int32 { LibTomCrypt.sha512_test() }
    /* SKIP EXTERN */ public func whirlpool_test() -> Int32 { LibTomCrypt.whirlpool_test() }
    /* SKIP EXTERN */ public func blake2b_512_test() -> Int32 { LibTomCrypt.blake2b_512_test() }
    /* SKIP EXTERN */ public func blake2b_384_test() -> Int32 { LibTomCrypt.blake2b_384_test() }
    /* SKIP EXTERN */ public func blake2b_256_test() -> Int32 { LibTomCrypt.blake2b_256_test() }
    /* SKIP EXTERN */ public func blake2b_160_test() -> Int32 { LibTomCrypt.blake2b_160_test() }
    /* SKIP EXTERN */ public func blake2s_256_test() -> Int32 { LibTomCrypt.blake2s_256_test() }
    /* SKIP EXTERN */ public func blake2s_224_test() -> Int32 { LibTomCrypt.blake2s_224_test() }
    /* SKIP EXTERN */ public func blake2s_160_test() -> Int32 { LibTomCrypt.blake2s_160_test() }
    /* SKIP EXTERN */ public func blake2s_128_test() -> Int32 { LibTomCrypt.blake2s_128_test() }
    /* SKIP EXTERN */ public func md2_test() -> Int32 { LibTomCrypt.md2_test() }
    /* SKIP EXTERN */ public func md4_test() -> Int32 { LibTomCrypt.md4_test() }
    /* SKIP EXTERN */ public func md5_test() -> Int32 { LibTomCrypt.md5_test() }
    /* SKIP EXTERN */ public func rmd128_test() -> Int32 { LibTomCrypt.rmd128_test() }
    /* SKIP EXTERN */ public func rmd160_test() -> Int32 { LibTomCrypt.rmd160_test() }
    /* SKIP EXTERN */ public func rmd256_test() -> Int32 { LibTomCrypt.rmd256_test() }
    /* SKIP EXTERN */ public func rmd320_test() -> Int32 { LibTomCrypt.rmd320_test() }
    /* SKIP EXTERN */ public func sha1_test() -> Int32 { LibTomCrypt.sha1_test() }
    /* SKIP EXTERN */ public func sha3_224_test() -> Int32 { LibTomCrypt.sha3_224_test() }
    /* SKIP EXTERN */ public func sha3_256_test() -> Int32 { LibTomCrypt.sha3_256_test() }
    /* SKIP EXTERN */ public func sha3_384_test() -> Int32 { LibTomCrypt.sha3_384_test() }
    /* SKIP EXTERN */ public func sha3_512_test() -> Int32 { LibTomCrypt.sha3_512_test() }
    /* SKIP EXTERN */ public func sha3_shake_test() -> Int32 { LibTomCrypt.sha3_shake_test() }
    /* SKIP EXTERN */ public func keccak_224_test() -> Int32 { LibTomCrypt.keccak_224_test() }
    /* SKIP EXTERN */ public func keccak_256_test() -> Int32 { LibTomCrypt.keccak_256_test() }
    /* SKIP EXTERN */ public func keccak_384_test() -> Int32 { LibTomCrypt.keccak_384_test() }
    /* SKIP EXTERN */ public func keccak_512_test() -> Int32 { LibTomCrypt.keccak_512_test() }
    /* SKIP EXTERN */ public func tiger_test() -> Int32 { LibTomCrypt.tiger_test() }
    /* SKIP EXTERN */ public func blake2bmac_test() -> Int32 { LibTomCrypt.blake2bmac_test() }
    /* SKIP EXTERN */ public func blake2smac_test() -> Int32 { LibTomCrypt.blake2smac_test() }
    /* SKIP EXTERN */ public func f9_test() -> Int32 { LibTomCrypt.f9_test() }
    /* SKIP EXTERN */ public func hmac_test() -> Int32 { LibTomCrypt.hmac_test() }
    /* SKIP EXTERN */ public func omac_test() -> Int32 { LibTomCrypt.omac_test() }
    /* SKIP EXTERN */ public func pelican_test() -> Int32 { LibTomCrypt.pelican_test() }
    /* SKIP EXTERN */ public func pmac_test() -> Int32 { LibTomCrypt.pmac_test() }
    /* SKIP EXTERN */ public func poly1305_test() -> Int32 { LibTomCrypt.poly1305_test() }
    /* SKIP EXTERN */ public func xcbc_test() -> Int32 { LibTomCrypt.xcbc_test() }
    /* SKIP EXTERN */ public func hkdf_test() -> Int32 { LibTomCrypt.hkdf_test() }
    /* SKIP EXTERN */ public func adler32_test() -> Int32 { LibTomCrypt.adler32_test() }
    /* SKIP EXTERN */ public func crc32_test() -> Int32 { LibTomCrypt.crc32_test() }
    /* SKIP EXTERN */ public func ctr_test() -> Int32 { LibTomCrypt.ctr_test() }
    /* SKIP EXTERN */ public func lrw_test() -> Int32 { LibTomCrypt.lrw_test() }
    /* SKIP EXTERN */ public func xts_test() -> Int32 { LibTomCrypt.xts_test() }
    /* SKIP EXTERN */ public func chacha20_prng_test() -> Int32 { LibTomCrypt.chacha20_prng_test() }
    /* SKIP EXTERN */ public func fortuna_test() -> Int32 { LibTomCrypt.fortuna_test() }
    /* SKIP EXTERN */ public func rc4_test() -> Int32 { LibTomCrypt.rc4_test() }
    /* SKIP EXTERN */ public func sober128_test() -> Int32 { LibTomCrypt.sober128_test() }
    /* SKIP EXTERN */ public func sprng_test() -> Int32 { LibTomCrypt.sprng_test() }
    /* SKIP EXTERN */ public func yarrow_test() -> Int32 { LibTomCrypt.yarrow_test() }
    /* SKIP EXTERN */ public func chacha_test() -> Int32 { LibTomCrypt.chacha_test() }
    /* SKIP EXTERN */ public func rabbit_test() -> Int32 { LibTomCrypt.rabbit_test() }
    /* SKIP EXTERN */ public func rc4_stream_test() -> Int32 { LibTomCrypt.rc4_stream_test() }
    /* SKIP EXTERN */ public func salsa20_test() -> Int32 { LibTomCrypt.salsa20_test() }
    /* SKIP EXTERN */ public func xsalsa20_test() -> Int32 { LibTomCrypt.xsalsa20_test() }
    /* SKIP EXTERN */ public func sober128_stream_test() -> Int32 { LibTomCrypt.sober128_stream_test() }
    /* SKIP EXTERN */ public func sosemanuk_test() -> Int32 { LibTomCrypt.sosemanuk_test() }

}
