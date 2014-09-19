#import <Foundation/Foundation.h>

@interface NSURL (ZXURL)


-(NSString *)ws_parameterForKey:(NSString *)key;
-(NSDictionary *)ws_parameters;
/**
 *  URL连接参数
 */
- (NSURL *)ws_serializeParams:(NSDictionary *)params;

@end
