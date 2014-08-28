//
//  NGWeak.h
//  NGAudioPlayer
//
//  Created by Matthias Tretter on 21.06.12.
//  Copyright (c) 2012 NOUS Wissensmanagement GmbH. All rights reserved.
//


#if __has_feature(objc_arc_weak)
    #define ng_weak  weak
    #define __ng_weak __weak
#else
    #define ng_weak  unsafe_unretained
    #define __ng_weak __unsafe_unretained
#endif
