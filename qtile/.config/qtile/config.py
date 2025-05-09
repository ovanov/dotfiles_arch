# -*- coding: utf-8 -*-

#        _   _ _                         __ _       
#       | | (_) |                       / _(_)      
#   __ _| |_ _| | ___    ___ ___  _ __ | |_ _  __ _ 
#  / _` | __| | |/ _ \  / __/ _ \| '_ \|  _| |/ _` |
# | (_| | |_| | |  __/ | (_| (_) | | | | | | | (_| |
#  \__, |\__|_|_|\___|  \___\___/|_| |_|_| |_|\__, |
#     | |                                      __/ |
#     |_|                                     |___/ 


import os
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from typing import List  # noqa: F401

mod = "mod4"                                     # Sets mod key to SUPER/WINDOWS
myTerm = "alacritty"                             # My terminal of choice
myConfig = "/home/jova/.config/qtile/config.py"    # The Qtile config file location

keys = [
         #----The essentials----
         Key([mod], "Return",
             lazy.spawn(myTerm),
             desc='Launches My Terminal'
             ),
         Key([mod, "shift"], "Return",
             lazy.spawn("rofi -show drun -show-icons"),
             desc='ROFI drun'
             ),
         Key([mod], "Tab",
             lazy.spawn("rofi -show window"),
             desc='switch between windows',
             ),
         Key([mod, "shift"], "e",
             lazy.spawn("pcmanfm"),
             desc='open Nemo'
             ),
         Key([mod, "shift"], "Tab",
             lazy.next_layout(),
             desc='Toggle through layouts'
             ),
         Key([mod], "w",
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key([mod, "shift"], "r",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key([mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),
         Key(["mod1", "shift"], "e",
             lazy.spawn("emacsclient -c -a emacs"),
             desc='Doom Emacs'
             ),
         #---Switch focus of monitors----
         Key([mod], "period",
             lazy.next_screen(),
             desc='Move focus to next monitor'
             ),
         Key([mod], "comma",
             lazy.prev_screen(),
             desc='Move focus to prev monitor'
             ),
         #----Treetab controls----
         Key([mod, "control"], "k",
             lazy.layout.section_up(),
             desc='Move up a section in treetab'
             ),
         Key([mod, "control"], "j",
             lazy.layout.section_down(),
             desc='Move down a section in treetab'
             ),
         #-----Window controls----
         Key([mod], "k",
             lazy.layout.down(),
             desc='Move focus down in current stack pane'
             ),
         Key([mod], "j",
             lazy.layout.up(),
             desc='Move focus up in current stack pane'
             ),
         Key([mod, "shift"], "k",
             lazy.layout.shuffle_down(),
             desc='Move windows down in current stack'
             ),
         Key([mod, "shift"], "j",
             lazy.layout.shuffle_up(),
             desc='Move windows up in current stack'
             ),
         Key([mod], "h",
             lazy.layout.grow(),
             lazy.layout.increase_nmaster(),
             desc='Expand window (MonadTall), increase number in master pane (Tile)'
             ),
         Key([mod], "l",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),
         Key([mod], "n",
             lazy.layout.normalize(),
             desc='normalize window size ratios'
             ),
         Key([mod], "m",
             lazy.layout.maximize(),
             desc='toggle window between minimum and maximum sizes'
             ),
         Key([mod, "shift"], "f",
             lazy.window.toggle_floating(),
             desc='toggle floating'
             ),
         Key([mod, "shift"], "m",
             lazy.window.toggle_fullscreen(),
             desc='toggle fullscreen'
             ),
         #----Stack controls------
         Key([mod, "shift"], "space",
             lazy.layout.rotate(),
             lazy.layout.flip(),
             desc='Switch which side main pane occupies (XmonadTall)'
             ),
         Key([mod], "space",
             lazy.layout.next(),
             desc='Switch window focus to other pane(s) of stack'
             ),
         Key([mod, "control"], "Return",
             lazy.layout.toggle_split(),
             desc='Toggle between split and unsplit sides of stack'
             ),
         #----Multimedia Keys-----
         Key([], "XF86AudioMute",
             lazy.spawn("amixer set Master toggle"),
             desc='Mute/Unmute audio'
             ),
         Key([], "XF86AudioRaiseVolume",
             lazy.spawn("amixer set Master 5%+ unmute"),
             desc='Raise Volume'
             ),
         Key([], "XF86AudioLowerVolume",
             lazy.spawn("amixer set Master 5%-"),
             desc='Lower Volume'
             ),
         Key([], "XF86AudioPrev",
             lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"),
             desc='Previous audio track'
             ),
         Key([], "XF86AudioNext",
             lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"),
             desc='Next audio track'
             ),
         Key([], "XF86AudioPlay",
             lazy.spawn("dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"),
             desc='Play/Pause audio track'
             ),
]

group_names = [("", {'layout': 'monadtall'}),
               ("爵", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'floating'}),
               ("", {'layout': 'floating'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

colors = []
cache='/home/jova/.cache/wal/colors'
def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()
load_colors(cache)

layout_theme = {"border_width": 4,
                "margin": 8,
                "border_focus": colors[7], #"#c0c0c0"
                "border_normal": colors[0] #"1D2330"
                }

layouts = [
    layout.MonadWide(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    #layout.Stack(num_stacks=2),
    #layout.TreeTab(
    #     font = "NotoMono Nerd Font Bold",
    #     fontsize = 10,
    #     sections = ["FIRST", "SECOND"],
    #     section_fontsize = 11,
    #     bg_color = "141414",
    #     active_bg = "90C435",
    #     active_fg = "000000",
    #     inactive_bg = "384323",
    #     inactive_fg = "a0a0a0",
    #     padding_y = 5,
    #     section_top = 10,
    #     panel_width = 320
    #     ),
    layout.Floating(**layout_theme)
]


# colors = [["#0C0C0C", "#0C0C0C"], # panel background
          # ["#434758", "#434758"], # background for current screen tab
          # ["#ffffff", "#ffffff"], # font color for group names
          # ["#ff5555", "#ff5555"], # border line color for current tab
          # ["#8d62a9", "#8d62a9"], # border line color for other tab and odd widgets
          # ["#668bd7", "#668bd7"], # color for the even widgets
          # ["#e1acff", "#e1acff"], # window name
          # ["#6272a4", "#6272a4"]]



prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="CousineNerd Font",
    fontsize = 12,
    padding = 2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
              widget.Sep(
                       linewidth = 0,
                       padding = 5,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.TextBox(
                      text = '',
                      background = colors[0],
                      foreground = colors[7],
                      padding = 7,
                      fontsize = 18
                      ),
              widget.GroupBox(
                       font = "JetBrainsMono Bold",
                       fontsize = 28,
                       margin_y = 3,
                       margin_x = 2,
                       padding_y = 7,
                       padding_x = 3,
                       borderwidth = 3,
                       active = colors[7],
                       inactive = colors[1],
                       rounded = False,
                       highlight_color = colors[0],
                       highlight_method = "line",
                       this_current_screen_border = colors[7], #"#c0c0c0"
                       other_screen_border = colors[1],
                       other_current_screen_border = colors[2],
                       this_screen_border = colors [2],
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Prompt(
                       prompt = prompt,
                       font = "JetBrainsMono Bold",
                       padding = 11,
                       foreground = colors[6],
                       background = colors[0],
                       fontsize = 14
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 100,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.WindowName(
                       foreground = colors[6],
                       font = "JetBrainsMono Bold",
                       background = colors[0],
                       padding = 0,
                       fontsize = 13
                       ),
              widget.TextBox(
                      text = "🖬",
                      foreground = colors[7],
                      background = colors[0],
                      padding = 4,
                      fontsize = 16
                      ),
              widget.Memory(
                      font = "JetBrainsMono Bold",
                      foreground = colors[6],
                      background = colors[0],
                      mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
                      padding = 5
                      ),
              widget.Sep(
                       linewidth = 1,
                       padding = 15,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.TextBox(
                       text = "ﱘ",
                       foreground = colors[7],
                       mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('pavucontrol')},
                       background = colors[0],
                       padding = 4,
                       fontsize = 16
                       ),
              widget.Volume(
                       font = "JetBrainsMono Bold",
                       foreground = colors[6],
                       background = colors[0],
                       padding = 10
                       ),
              widget.Sep(
                       linewidth = 1,
                       padding = 15,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[7],
                       background = colors[0],
                       padding = 0,
                       scale = 0.7
                       ),
              widget.CurrentLayout(
                       font = "JetBrainsMono Bold",
                       foreground = colors[6],
                       background = colors[0],
                       padding = 10
                       ),
              widget.Sep(
                       linewidth = 1,
                       padding = 15,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Systray(
                       background = colors[0],
                       padding = 5
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 8,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.TextBox(
                      text = "",
                       foreground = colors[7],
                       mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('orage')},
                       background = colors[0],
                       padding = 13,
                       fontsize = 17
                       ),
              widget.Clock(
                       font = "JetBrainsMono Bold",
                       foreground = colors[6],
                       background = colors[0],
                       format = "%d.%b  %H:%M "
                       ),
              ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1                       # Slicing removes unwanted widgets on Monitors 1,3

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    del widgets_screen2[6:11]
    return widgets_screen2                       # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20))]

def init_screens_vert():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
