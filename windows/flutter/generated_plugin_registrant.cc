//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <zego_express_engine/zego_express_engine_plugin.h>
<<<<<<< HEAD
#include <zego_zim/zego_zim_plugin.h>
=======
>>>>>>> 2448694f18ef4d2da93157d866f03c6ca7da306f

void RegisterPlugins(flutter::PluginRegistry* registry) {
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
  ZegoExpressEnginePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ZegoExpressEnginePlugin"));
<<<<<<< HEAD
  ZegoZimPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ZegoZimPlugin"));
=======
>>>>>>> 2448694f18ef4d2da93157d866f03c6ca7da306f
}
