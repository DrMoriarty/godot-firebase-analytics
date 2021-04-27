
#import <Foundation/Foundation.h>
#import "godot_plugin.h"
#import "godot_plugin_class.h"
#import "core/engine.h"

PluginClass *plugin;

void firebase_analytics_init() {
    plugin = memnew(PluginClass);
    Engine::get_singleton()->add_singleton(Engine::Singleton("FirebaseAnalytics", plugin));
}

void firebase_analytics_deinit() {
   if (plugin) {
       memdelete(plugin);
   }
}
