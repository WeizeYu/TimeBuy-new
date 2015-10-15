#import <Foundation/Foundation.h>

#ifdef DEBUG
#define MTLog(...) NSLog(__VA_ARGS__)
#else
#define MTLog(...)
#endif

#define MTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define MTGlobalBg MTColor(230, 230, 230)

#define MTNotificationCenter [NSNotificationCenter defaultCenter]

extern NSString *const SexDidChangedNotification;
extern NSString *const SexKey;

extern NSString *const SignatureDidChangedNotification;
extern NSString *const SignKey;

extern NSString *const CommonDidChangeNotification;
extern NSString *const CommenKey;
extern NSString *const CellTag;

extern NSString *const MTRegionDidChangeNotification;
extern NSString *const MTSelectRegion;
extern NSString *const MTSelectSubregionName;

extern NSString *const MTCollectStateDidChangeNotification;
extern NSString *const MTIsCollectKey;
extern NSString *const MTCollectDealKey;