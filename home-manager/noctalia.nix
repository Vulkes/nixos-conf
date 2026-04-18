{
  config,
  pkgs,
  inputs,
  stylix,
  ...
}: {
  # import the home manager module
  stylix.targets.noctalia-shell.enable = false;
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        showOutline = true;
        backgroundOpacity = 0.9;
        exclusive = false;
        widgets = {
          left = [
            {
              id = "Workspace";
              characterCount = 2;
              colorizeIcons = false;
              enableScrollWheel = true;
              followFocusedScreen = false;
              groupedBorderOpacity = 1;
              hideUnoccupied = false;
              iconScale = 0.8;
              labelMode = "index";
              showApplications = false;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
            {
              id = "ActiveWindow";
              colorizeIcons = false;
              hideMode = "hidden";
              maxWidth = 145;
              scrollingMode = "hover";
              showIcon = true;
              useFixedWidth = false;
            }
          ];
          center = [
            {
              id = "Clock";
              customFont = "JetBrainsMono Nerd Font";
              formatHorizontal = "MMM dd | HH:mm";
              formatVertical = "HH mm - dd MM";
              tooltipFormat = "yyyy-MM-dd | HH:mm:ss t | ddd";
              useCustomFont = true;
              usePrimaryColor = true;
            }
          ];
          right = [
            {
              id = "MediaMini";
              compactMode = false;
              compactShowAlbumArt = true;
              compactShowVisualizer = false;
              hideMode = "hidden";
              hideWhenIdle = false;
              maxWidth = 300;
              panelShowAlbumArt = true;
              panelShowVisualizer = true;
              scrollingMode = "hover";
              showAlbumArt = true;
              showArtistFirst = false;
              showProgressRing = true;
              showVisualizer = true;
              useFixedWidth = true;
              visualizerType = "linear";
            }
            {
              id = "SystemMonitor";
              compactMode = true;
              diskPath = "/";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = false;
              showGpuTemp = false;
              showLoadAverage = false;
              showMemoryAsPercent = false;
              showMemoryUsage = true;
              showNetworkStats = false;
              showSwapUsage = false;
              useMonospaceFont = true;
              usePrimaryColor = false;
            }
            {
              id = "Tray";
              blacklist = [
                "udiskie"
                "spotify-client"
              ];
              colorizeIcons = false;
              drawerEnabled = true;
              hidePassive = false;
            }
            {
              id = "NotificationHistory";
              hideWhenZero = false;
              hideWhenZeroUnread = false;
              showUnreadBadge = true;
            }
            {
              id = "Battery";
              displayMode = "onhover";
              hideIfIdle = false;
              hideIfNotDetected = true;
              showNoctaliaPerformance = false;
              showPowerProfiles = true;
              warningThreshold = 25;
            }
            {
              id = "Volume";
              displayMode = "onhover";
              middleClickCommand = "pwvucontrol";
            }
            {
              id = "Brightness";
              displayMode = "onhover";
            }
            {
              id = "ControlCenter";
              colorizeDistroLogo = false;
              colorizeSystemIcon = "none";
              customIconPath = "";
              enableColorization = false;
              icon = "noctalia";
              useDistroLogo = false;
            }
          ];
        };
      };
      general = {
        avatarImage = "${config.home.homeDirectory}/Pictures/They_who_reign.png";
        radiusRatio = 0.1;
        iRadiusRatio = 0.1;
        boxRadiusRatio = 0.1;
        animationSpeed = 2;
        enableShadows = false;
        telemetryEnabled = false;
      };
      ui = {
        fontDefault = "DejaVu Sans";
        fontFixed = "JetBrainsMono Nerd Font";
        panelBackgroundOpacity = 0.8;
      };
      location = {
        name = "Kharagpur";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = 0;
        hideWeatherTimezone = false;
        hideWeatherCityName = true;
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = false;
        directory = "${config.home.homeDirectory}/Pictures/walls";
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        fillColor = "#000000";
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.10;
        useWallhaven = false;
      };
      appLauncher = {
        enableClipboardHistory = true;
        enableClipPreview = true;
        clipboardWrapText = true;
        position = "center";
        terminalCommand = "alacritty -e";
        iconMode = "native";
        enableSettingsSearch = false;
        ignoreMouseInput = true;
      };
      controlCenter = {
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "PowerProfile";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "WallpaperSelector";
            }
          ];
        };
      };
      dock = {
        enabled = false;
      };
      notifications = {
        enabled = true;
        overlayLayer = true;
        backgroundOpacity = 0.9;
        enableKeyboardLayoutToast = false;
      };

      osd = {
        enabled = true;
        backgroundOpacity = 0.8;
        enabledTypes = [
          0
          1
          2
          3
        ];
      };
      audio = {
        volumeStep = 5;
      };
      brightness = {
        brightnessStep = 5;
      };
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Catppuccin";
        darkMode = true;
        schedulingMode = "off";
        generationMethod = "tonal-spot";
      };
    };
  };
}
