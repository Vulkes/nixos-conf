{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.mango = {
    enable = true;

    settings = {
      # Window effect
      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
      blur_params = {
        num_passes = 2;
        radius = 5;
        noise = 0.02;
        brightness = 0.9;
        contrast = 0.9;
        saturation = 1.2;
      };

      shadows = 0;
      layer_shadows = 0;
      shadow_only_floating = 1;
      shadows_size = 10;
      shadows_blur = 15;
      shadows_position_x = 0;
      shadows_position_y = 0;
      shadowscolor = "0x000000ff";

      border_radius = 6;
      no_radius_when_single = 0;
      focused_opacity = 1.0;
      unfocused_opacity = 1.0;

      dim_enable = 0;
      dim_focused_color = "0x00000000";
      dim_unfocused_color = "0x00000055";

      # Animations
      animations = 1;
      layer_animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_fade_in = 1;
      animation_fade_out = 1;
      tag_animation_direction = 0;
      zoom_initial_ratio = 0.4;
      zoom_end_ratio = 0.8;
      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.8;
      animation_duration = {
        move = 250;
        open = 250;
        tag = 250;
        close = 250;
        focus = 0;
      };
      animation_curve = {
        open = "0.46,1.0,0.29,1";
        move = "0.46,1.0,0.29,1";
        tag = "0.46,1.0,0.29,1";
        close = "0.08,0.92,0,1";
        focus = "0.46,1.0,0.29,1";
        opafadeout = "0.5,0.5,0.5,0.5";
        opafadein = "0.46,1.0,0.29,1";
      };

      # Scroller layout
      scroller_default_proportion = 0.33;
      scroller_prefer_overspread = 1;
      edge_scroller_pointer_focus = 1;
      edge_scroller_focus_allow_speed = 0.0;
      scroller_ignore_proportion_single = 1;
      scroller_default_proportion_single = 1.0;
      scroller_proportion_preset = "0.33,0.5,0.67,1.0";

      # Overview
      hotarea_size = 10;
      enable_hotarea = 0;
      hotarea_disable_on_fullscreen = 1;
      overviewgappi = 5;
      overviewgappo = 30;
      overcircle_center_ratio = 0.5;

      # Misc
      no_border_when_single = 0;
      axis_bind_apply_timeout = 100;
      focus_on_activate = 1;
      idleinhibit_ignore_visible = 0;
      idleinhibit_when_fullscreen = 0;
      sloppyfocus = 1;
      warpcursor = 1;
      focus_cross_monitor = 0;
      focusdir_only_zone_overlap = 1;
      focus_cross_tag = 0;
      enable_floating_snap = 0;
      snap_distance = 30;
      float_full_to_top = 0;
      cursor_size = 24;
      drag_tile_to_tile = 1;
      drag_tile_small = 1;

      # Keyboard
      repeat_rate = 25;
      repeat_delay = 600;
      numlockon = 0;
      xkb_rules_layout = "us";

      # Trackpad
      disable_trackpad = 0;
      tap_to_click = 1;
      tap_and_drag = 1;
      drag_lock = 1;
      trackpad_natural_scrolling = 0;
      trackpad_disable_while_typing = 1;
      trackpad_left_handed = 0;
      trackpad_middle_button_emulation = 0;
      swipe_min_threshold = 1;

      # Mouse
      mouse_natural_scrolling = 0;
      mouse_accel_profile = 0;

      # Appearance
      gappih = 5;
      gappiv = 5;
      gappoh = 10;
      gappov = 10;
      scratchpad_width_ratio = 0.8;
      scratchpad_height_ratio = 0.9;
      borderpx = 4;
      rootcolor = "0x201b14ff";
      bordercolor = "0x444444ff";
      dropcolor = "0x8FBA7C55";
      splitcolor = "0xEB441EFF";
      focuscolor = "0xc9b890ff";
      maximizescreencolor = "0x89aa61ff";
      urgentcolor = "0xad401fff";
      scratchpadcolor = "0x516c93ff";
      globalcolor = "0xb153a7ff";
      overlaycolor = "0x14a57cff";

      tagrule = [
        "id:1,layout_name:scroller"
        "id:2,layout_name:scroller"
        "id:3,layout_name:scroller"
        "id:4,layout_name:scroller"
        "id:5,layout_name:scroller"
        "id:6,layout_name:scroller"
        "id:7,layout_name:scroller"
        "id:8,layout_name:scroller"
        "id:9,layout_name:scroller"
      ];

      bind = [
        "SUPER,p,reload_config"
        "SUPER,space,spawn,noctalia msg panel-toggle launcher"
        "SUPER,Return,spawn,alacritty"
        "SUPER,m,quit"
        "SUPER,c,killclient,"
        "SUPER,Tab,focusstack,next"
        "SUPER,h,focusdir,left"
        "SUPER,l,focusdir,right"
        "SUPER,Up,focusdir,up"
        "SUPER,Down,focusdir,down"
        "SUPER+SHIFT,Up,exchange_client,up"
        "SUPER+SHIFT,Down,exchange_client,down"
        "SUPER+SHIFT,H,exchange_client,left"
        "SUPER+SHIFT,L,exchange_client,right"
        "SUPER,g,toggleglobal,"
        "SUPER,backslash,togglefloating,"
        "SUPER,a,togglemaximizescreen,"
        "SUPER,f,togglefullscreen,"
        "SUPER+SHIFT,f,togglefakefullscreen,"
        "SUPER,o,toggleoverlay,"
        "SUPER,i,minimized"
        "SUPER,z,toggle_scratchpad"
        "SUPER+SHIFT,i,restore_minimized"
        # scroller layout
        "SUPER,e,set_proportion,1.0"
        "SUPER,r,switch_proportion_preset,"
        # "alt+super+ctrl,H,scroller_stack,left"
        # "alt+super+ctrl,l,scroller_stack,right"
        # "alt+super+ctrl,Up,scroller_stack,up"
        # "alt+super+ctrl,Down,scroller_stack,down"
        "SUPER,n,switch_layout"
        # tag switch
        "SUPER,1,view,1,0"
        "SUPER,2,view,2,0"
        "SUPER,3,view,3,0"
        "SUPER,4,view,4,0"
        "SUPER,5,view,5,0"
        "SUPER,6,view,6,0"
        "SUPER,7,view,7,0"
        "SUPER,8,view,8,0"
        "SUPER,9,view,9,0"
        "SUPER+SHIFT,1,tag,1,0"
        "SUPER+SHIFT,2,tag,2,0"
        "SUPER+SHIFT,3,tag,3,0"
        "SUPER+SHIFT,4,tag,4,0"
        "SUPER+SHIFT,5,tag,5,0"
        "SUPER+SHIFT,6,tag,6,0"
        "SUPER+SHIFT,7,tag,7,0"
        "SUPER+SHIFT,8,tag,8,0"
        "SUPER+SHIFT,9,tag,9,0"
        # monitor switch
        "alt+shift,H,focusmon,left"
        "alt+shift,L,focusmon,right"
        "SUPER+Alt,H,tagmon,left"
        "SUPER+Alt,l,tagmon,right"
        "NONE,XF86AudioRaiseVolume,spawn,noctalia msg volume-up"
        "NONE,XF86AudioLowerVolume,spawn,noctalia msg volume-down"
        "NONE,XF86AudioMute,spawn,noctalia msg volume-mute"
        "NONE,XF86MonBrightnessUp,spawn,noctalia msg brightness-up"
        "NONE,XF86MonBrightnessDown,spawn,noctalia msg brightness-down"
        "NONE,Print,spawn,noctalia msg screenshot-fullscreen"
        "SUPER,Print,spawn,noctalia msg screenshot-region"
      ];

      # Mouse button bindings
      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
      ];

      axisbind = [
        "SUPER,UP,viewtoleft_have_client"
        "SUPER,DOWN,viewtoright_have_client"
      ];

      exec-once = [
        "noctalia"
        "firefox"
        "vesktop"
        "spotify"
      ];

      windowrule-once = [
        "istagsilent:1;scroller_proportion:1.0;tags:2;appid:firefox"
        "istagsilent:1;scroller_proportion:1.0;tags:3;appid:vesktop"
        "istagsilent:1;scroller_proportion:1.0;tags:5;appid:Spotify"
      ];
    };
  };
}
