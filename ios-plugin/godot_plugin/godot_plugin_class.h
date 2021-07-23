//
//  godot_plugin_implementation.h
//  godot_plugin
//
//  Created by Sergey Minakov on 14.08.2020.
//  Copyright © 2020 Godot. All rights reserved.
//

#pragma once

#include "core/object.h"

class FirebaseAnalytics : public Object {
    GDCLASS(FirebaseAnalytics, Object);
    
    static void _bind_methods();
    
public:
    void setUserProperty (String arg1, String arg2);
    void setUserId (String arg1);
    void logEvent (String arg1, Dictionary arg2);
    
    FirebaseAnalytics();
    ~FirebaseAnalytics();
};




