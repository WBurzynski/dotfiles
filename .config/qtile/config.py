# -*- coding: utf-8 -*-
import os
import re
import socket
import subprocess
from libqtile.config import Drag, Key, Screen, Group, Drag, Click, Rule
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer


mod = "mod4"
mod1 = "alt"
mod2 = "control"
myTerm = "alacritty"
home = os.path.expanduser('~')


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)
    
def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

# keybindings
keys = [
    # Launch terminal, kill window, restart and exit Qtile
    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "x", lazy.window.kill()),
    # Key([mod], "Escape", lazy.spawn('xkill')),    
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    # Key([mod], "x", lazy.spawn("powerspec")),
    
    # Dmenu, Rofi and Gmrun
    # Key([mod, "mod1"], "d", lazy.spawn("dmenu_run")),
    # Key([mod, "mod1"], "n", lazy.spawn("networkmanager_dmenu")),
    # Key([mod, "mod1"], "r", lazy.spawn("dmenufm")),
    Key([mod,"shift"], "Return", lazy.spawn("rofi -modi drun -show drun -show-icons")),
    Key([mod, "mod1"], "c", lazy.spawn("rofi -show emoji -modi emoji")),
    Key([mod, "mod1"], "v", lazy.spawn("rofi-locate")),
    # Key([mod, "mod1"], "z", lazy.spawn("gmrun")),
    
    # Custom key bindings
    Key([mod], "b", lazy.spawn("brave")),
    Key([mod], "e", lazy.spawn("dolphin")),
    Key([mod], "p", lazy.spawn("pamac-manager")),
    Key([mod], "i", lazy.spawn("nitrogen")),
    # Key([mod], "p", lazy.spawn('pavucontrol')),

    # Volume keys
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse sset Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse sset Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse sset Master 5%+")),
    
    # Toggle layouts
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    # Change window focus	
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod, "mod1"], "h", lazy.layout.previous()), # Stack
    Key([mod, "mod1"], "l", lazy.layout.next()),     # Stack
  
    # Switch focus to a physical monitor (dual/triple set up)
    # Key([mod], "period", lazy.next_screen()),
    # Key([mod], "comma", lazy.prev_screen()),
    # Key([mod], "a", lazy.to_screen(0)),
    # Key([mod], "b", lazy.to_screen(1)),
    # Key([mod], "c", lazy.to_screen(2)),
    
    # Move windows to different physical screens
    Key([mod, "shift"], "period", lazy.function(window_to_previous_screen)),
    Key([mod, "shift"], "comma", lazy.function(window_to_next_screen)),
    Key([mod], "t", lazy.function(switch_screens)),
    
    # Resize layout	
    Key([mod, "control"], "l",
       lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    # Flip left and right pains and move windows
    Key([mod, "shift"], "f", lazy.layout.flip()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod], "m", lazy.layout.toggle_maximize()), # Stack
    Key([mod, "shift"], "Left",
        lazy.layout.swap_left(),
        lazy.layout.client_to_previous()), # Stack
    Key([mod, "shift"], "Right",
        lazy.layout.swap_right(),
        lazy.layout.client_to_next()), # Stack
    ]
		
groups = []

# Allocate layouts and labels
group_names = ["1", "2", "3", "4", "5", "6", "7", "8",]
group_labels = ["", "", "", "", "", "", "", "",]
group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall",]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([
    # Workspace navigation
    Key([mod], i.name, lazy.group[i.name].toscreen()), 
    Key([mod], "Tab", lazy.screen.next_group()),	   	
    Key([mod, "control"], i.name, lazy.window.togroup(i.name)), 
    Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()), 
    ])


def init_layout_theme():
    return {"margin":5,
            "border_width":2,
            "border_focus": "#5e81ac",
            "border_normal": "#4c566a"
            }

layout_theme = init_layout_theme()


layouts = [
    layout.MonadTall(margin=5, border_width=3, border_focus="#ff00ff", border_normal="#00ff00"),
    layout.MonadWide(margin=8, border_width=3, border_focus="#ff00ff", border_normal="#00ff00"),
    layout.Stack(stacks=2, **layout_theme),
    layout.Floating(**layout_theme),
    layout.Max(**layout_theme)
]

# Bar colours
def init_colors():
    return [["#002f00", "#002f00"], # color 0 - dark green
            ["#00ff00", "#00ff00"], # color 1 - light green
            ["#7f007f", "#7f007f"], # color 2 - dark magenta
            ["#ff00ff", "#ff00ff"], # color 3 - light magenta
            ["#f3f4f5", "#f3f4f5"], # color 4 - white-ish
            ["#3384d0", "#3384d0"], # color 5 - 
            ["#f3f4f5", "#f3f4f5"], # color 6 - 
            ["#cd1f3f", "#cd1f3f"], # color 7 - 
            ["#62FF00", "#62FF00"]] # color 8 - 


colors = init_colors()


# Widgets
def init_widgets_defaults():
    return dict(font="UbuntuMono Nerd Font",
                fontsize = 16,
                padding = 2,
                background=colors[0],
                foreground=colors[4])

widget_defaults = init_widgets_defaults()
mySep = widget.Sep(
        linewidth = 1,
        padding = 10,
        foreground = colors[1])

def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [
            widget.GroupBox(font="FontAwesome",
                fontsize = 20,
                margin_y = 3,
                margin_x = 0,
                padding_y = 6,
                padding_x = 5,
                borderwidth = 0,
                disable_drag = True,
                active = colors[3],
                inactive = colors[2],
                rounded = False,
                highlight_method = "text",
                this_current_screen_border = colors[1],),
            mySep,
            widget.CurrentLayoutIcon(
                padding = 0,
                scale = 0.7,
                foreground = colors[3],),
            widget.CurrentLayout(
                foreground = colors[3],),
            mySep,
            widget.WindowName(
                foreground = colors[1]),
            # mySep,
            # widget.TaskList(
            #     font = "UbuntuMono Nerd Font",
            #     fontsize = 14,
            #     border = colors[3],
            #     margin = 3),
            mySep,
            widget.TextBox(
                text = " 🌐 ",),
            widget.Net(
                foreground = colors[3]),
            mySep,
            widget.CPU(
                format = '  {load_percent}% ',
                update_interval = 3,
                foreground = colors[1],),
            mySep,
            widget.TextBox(
                text=" 🧠 ",
                mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
                padding = 0,),
            widget.Memory(
                update_interval = 1,
                foreground = colors[3]),
            mySep,
            widget.TextBox(
                text = " 🌡️",
                padding = 2,
                mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('xsensors')},),
            widget.ThermalSensor(
                padding = 5,
                foreground = colors[1],
                foreground_alert = colors[2],),
            mySep,
            widget.Volume(
                padding = 5,
                emoji = True),
            widget.Volume(
                padding = 5,
                foreground = colors[3]),
            mySep,
            widget.Clock(
                font="MesloLGS NF",
                format=" 🕦 %H:%M:%S 📅 %d.%m.%Y",
                foreground = colors[1],
                mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e calcurse')},),
            mySep,
            widget.Systray(),
            widget.TextBox(
                text = " ",),]
    return widgets_list

widgets_list = init_widgets_list()


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2

widgets_screen1 = init_widgets_screen1()
widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=26, margin=5)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=26, margin=5)),
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=26, margin=5))]
            
screens = init_screens()


   # Mouse config

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

dgroups_key_binder = None
dgroups_app_rules = []


main = None

@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]


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
    {'wmclass': 'Arandr'},
    {'wname': 'branchdialog'},
    {'wname': 'Open File'},
    {'wmclass': 'ssh-askpass'},

],  fullscreen_border_width = 0, border_width = 0)
auto_fullscreen = True

focus_on_window_activation = "focus" # or smart

wmname = "LG3D"
