import os
from libqtile import bar, widget
from libqtile.lazy import lazy
from libqtile.config import Screen

from functions import PWA
# widget_defaults = dict(
#     font="Ubuntu Mono",
#     fontsize = 12,
#     padding = 2,
#     background=colors[2]
# )

# extension_defaults = widget_defaults.copy()


class MyWidgets:
    myFont = 'Hack Nerd Font Propo'
    myFontSize = 15

    def __init__(self):
        #font = 'Hack Nerd Font Propo'
        self.termite = "termite"

    def init_widgets_list(self):
        '''
        Function that returns the desired widgets in form of list
        '''
        widgets_list = [
            widget.Sep(
                padding=6,
            ),
            widget.Sep(
                linewidth=0,
                padding=5,
            ),
            widget.GroupBox(
                font= self.myFont,
                fontsize=self.myFontSize,
                margin_y=2,
                margin_x=0,
                padding_y=5,
                padding_x=3,
                borderwidth=3,
                active='#ffffff',
                inactive='#7f7f7f',
                rounded=False,
                highlight_method='block',
                urgent_alert_method='block',
                disable_drag=True
            ),
            widget.Prompt(
                prompt=lazy.spawncmd(),
                font=self.myFont,
                fontsize=self.myFontSize,
                padding=10,
            ),
            widget.Sep(
                linewidth=0,
                padding=40,
            ),
            widget.WindowName(
                font=self.myFont,
                fontsize=self.myFontSize,
                padding=0
            ),
            widget.TextBox(
                font=self.myFont,
                fontsize=self.myFontSize,
                text=" 󰍛 ",
                padding=0,
            ),
            widget.Memory(
                font=self.myFont,
                fontsize=self.myFontSize,
                padding=5
            ),
            widget.TextBox(
                font=self.myFont,
                fontsize=self.myFontSize,
                text="  ",
                padding=0,
                mouse_callbacks={
                    "Button1": lambda qtile: qtile.cmd_spawn("pavucontrol")}
            ),
            widget.Volume(
                font=self.myFont,
                fontsize=self.myFontSize,
                padding=5
            ),
             widget.Clock(
                font=self.myFont,
                fontsize=self.myFontSize,

                mouse_callbacks={
                    "Button1": lambda qtile: qtile.cmd_spawn(PWA.calendar())},
                format="%B %d  %H:%M:%S "
            ),
            widget.Systray(
                padding=5
            ),

            widget.Sep(
                linewidth=0,
                padding=10,
            ),
        ]
        return widgets_list

    def init_widgets_screen(self):
        '''
        Function that returns the widgets in a list.
        It can be modified so it is useful if you  have a multimonitor system
        '''
        widgets_screen = self.init_widgets_list()
        return widgets_screen

    def init_widgets_screen2(self):
        '''
        Function that returns the widgets in a list.
        It can be modified so it is useful if you  have a multimonitor system
        '''
        widgets_screen2 = self.init_widgets_screen()
        return widgets_screen2

    def init_screen(self):
        '''
        Init the widgets in the screen
        '''
        return [Screen(top=bar.Bar(widgets=self.init_widgets_screen(), opacity=1.0, size=20)),
                Screen(top=bar.Bar(
                    widgets=self.init_widgets_screen2(), opacity=1.0, size=20))
                ]
