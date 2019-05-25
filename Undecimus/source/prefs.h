//
//  prefs.h
//  Undecimus
//
//  Created by Pwn20wnd on 5/3/19.
//  Copyright © 2019 Pwn20wnd. All rights reserved.
//

#ifndef prefs_h
#define prefs_h

#include <stdio.h>
#include <stdbool.h>

#define K_TWEAK_INJECTION          "TweakInjection"
#define K_LOAD_DAEMONS             "LoadDaemons"
#define K_DUMP_APTICKET            "DumpAPTicket"
#define K_REFRESH_ICON_CACHE       "RefreshIconCache"
#define K_BOOT_NONCE               "BootNonce"
#define K_EXPLOIT                  "Exploit"
#define K_DISABLE_AUTO_UPDATES     "DisableAutoUpdates"
#define K_DISABLE_APP_REVOKES      "DisableAppRevokes"
#define K_OVERWRITE_BOOT_NONCE     "OverwriteBootNonce"
#define K_EXPORT_KERNEL_TASK_PORT  "ExportKernelTaskPort"
#define K_RESTORE_ROOTFS           "RestoreRootFS"
#define K_INCREASE_MEMORY_LIMIT    "IncreaseMemoryLimit"
#define K_ECID                     "Ecid"
#define K_INSTALL_OPENSSH          "InstallOpenSSH"
#define K_INSTALL_CYDIA            "InstallCydia"
#define K_RELOAD_SYSTEM_DAEMONS    "DoReloadSystemDaemons"
#define K_HIDE_LOG_WINDOW          "HideLogWindow"
#define K_RESET_CYDIA_CACHE        "ResetCydiaCache"
#define K_SSH_ONLY                 "SSHOnly"
#define K_ENABLE_GET_TASK_ALLOW    "DoEnableGetTaskAllow"
#define K_SET_CS_DEBUGGED          "SetCSDebugged"
#define K_INSTALL_SILEO            "InstallSileo"
#define K_THEME                    "Theme"
#define K_REINSTALL_SILEO_SWITCH   "HideSileoSwitch"
#define K_AUTO_RESPRING            "AutoRespring"
#define K_HIDE_PROGRESS_HUD        "HideProgressHUD"

#define K_BACKGROUND_COLOR         "Background Color"
#define K_U0_COLOR                 "Unc0ver Logo Color"
#define K_FAKE_BUTTON_COLOR        "Fake Button Color"
#define K_FAKE_TINT_COLOR          "Fake Button Tint Color"
#define K_FAKE_TEXT_COLOR          "Fake Button Text Color"
#define K_GO_TEXT_COLOR            "Go Button Text Color"
#define K_OUTPUT_COLOR             "Output View Color"
#define K_OUTPUT_TEXT_COLOR        "Output View Text Color"
#define K_PICKER_TINT_COLOR        "Exploit Picker Tint Color"
#define K_TINT_COLOR               "Tint Color"
#define K_TEXT_COLOR               "Text Color"
#define K_DARK_TEXT_COLOR          "Dark Text Color"
#define K_LINK_COLOR               "Link Color"
#define K_DARK_STATUS_BAR          "Light Status Bar Content"

typedef struct {
    bool load_tweaks;
    bool load_daemons;
    bool dump_apticket;
    bool run_uicache;
    const char *boot_nonce;
    bool disable_auto_updates;
    bool disable_app_revokes;
    bool overwrite_boot_nonce;
    bool export_kernel_task_port;
    bool restore_rootfs;
    bool increase_memory_limit;
    const char *ecid;
    bool install_cydia;
    bool install_sileo;
    bool install_openssh;
    bool reload_system_daemons;
    bool reset_cydia_cache;
    bool ssh_only;
    bool enable_get_task_allow;
    bool set_cs_debugged;
    bool hide_log_window;
    bool uicache_sileo;
    bool uicache_cydia;
    int theme;
    bool reinstall_sileo_switch;
    bool auto_respring;
    bool hide_progress_hud;
    int exploit;
    
    int backgroundColor;
    int u0Color;
    int fakeButtonColor;
    int fakeTintColor;
    int fakeTextColor;
    int goTextColor;
    int outputColor;
    int outputTextColor;
    int pickerTintColor;
    int tintColor;
    int textColor;
    int darkTextColor;
    int linkColor;
    bool darkStatusBar;
} prefs_t;

prefs_t *new_prefs(void);
prefs_t *copy_prefs(void);
void release_prefs(prefs_t **prefs);
bool load_prefs(prefs_t *prefs);
bool set_prefs(prefs_t *prefs);
void register_default_prefs(void);
void repair_prefs(void);
void reset_prefs(void);

#endif /* prefs_h */
