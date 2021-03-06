//
//  NSString+ZXHash.h
//  ZXAdditions
//
//  Created by windorz on 2018/5/6.
//  Copyright © 2018年 windorz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZXHash)

#pragma mark 散列函数

/**
 计算 MD5 散列结果
 *  终端测试命令：
 *  @code
 *  md5 -s "string"
 *  @endcode
 *  <p>提示：随着 MD5 碰撞生成器的出现，MD5 算法不应被用于任何软件完整性检查或代码签名的用途。<p>
 @return 32个字符的 MD5 散列字符串
 */
- (NSString *)zx_md5String;


/**
 计算 SHA1 散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1
 *  @endcode
 @return 40个字符的 SHA1 散列字符串
 */
- (NSString *)zx_sha1String;


/**
 计算 SHA224 散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha224
 *  @endcode
 @return 56个字符的SHA224散列字符串
 */
- (NSString *)zx_sha224String;


/**
 计算 SHA256 散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha256
 *  @endcode
 @return 64个字符的SHA256散列字符串
 */
- (NSString *)zx_sha256String;


/**
 计算 SHA384 散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha384
 *  @endcode
 @return 96个字符的SHA 384散列字符串
 */
- (NSString *)zx_sha384String;


/**
  计算 SHA512 散列结果
  *  终端测试命令：
  *  @code
  *  echo -n "string" | openssl sha -sha512
  *  @endcode
  @return 128个字符的SHA 512散列字符串
  */
- (NSString *)zx_sha512String;


#pragma mark - HMAC 散列函数
/**
 计算HMAC MD5散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl dgst -md5 -hmac "key"
 *  @endcode
 @return 32个字符的HMAC MD5散列字符串
 */
- (NSString *)zx_hmacMD5StringWithKey:(NSString *)key;

/**
 计算HMAC SHA1散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha1 -hmac "key"
 *  @endcode
 @return 40个字符的HMAC SHA1散列字符串
 */
- (NSString *)zx_hmacSHA1StringWithKey:(NSString *)key;

/**
 计算HMAC SHA256散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha256 -hmac "key"
 *  @endcode
 @return 64个字符的HMAC SHA256散列字符串
 */
- (NSString *)zx_hmacSHA256StringWithKey:(NSString *)key;

/**
 计算HMAC SHA512散列结果
 *  终端测试命令：
 *  @code
 *  echo -n "string" | openssl sha -sha512 -hmac "key"
 *  @endcode
 @return 128个字符的HMAC SHA512散列字符串
 */
- (NSString *)zx_hmacSHA512StringWithKey:(NSString *)key;

#pragma mark 文件散列函数
/**
 计算文件的MD5散列结果
 *  终端测试命令：
 *  @code
 *  md5 file.dat
 *  @endcode
 @return 32个字符的MD5散列字符串
 */
- (NSString *)zx_fileMD5Hash;

/**
 计算文件的SHA1散列结果
 *  终端测试命令：
 *  @code
 *  openssl sha -sha1 file.dat
 *  @endcode
 @return 40个字符的SHA1散列字符串
 */
- (NSString *)zx_fileSHA1Hash;

/**
 计算文件的SHA256散列结果
 *  终端测试命令：
 *  @code
 *  openssl sha -sha256 file.dat
 *  @endcode
 @return 64个字符的SHA256散列字符串
 */
- (NSString *)zx_fileSHA256Hash;

/**
 计算文件的SHA512散列结果
 *  终端测试命令：
 *  @code
 *  openssl sha -sha512 file.dat
 *  @endcode
 @return 128个字符的SHA512散列字符串
 */
- (NSString *)zx_fileSHA512Hash;
@end
