#!/usr/bin/python

from PyQt6.QtGui import *
from PyQt6.QtWidgets import *
from PyQt6.QtCore import *
import sys
import os

class Window(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("powermenu")

        
        shutdownIcon = QIcon('/home/gargula/dotfiles/bin/icons/shutdown.png')
        rebootIcon = QIcon('/home/gargula/dotfiles/bin/icons/reboot.png')
        logoutIcon = QIcon('/home/gargula/dotfiles/bin/icons/logout.png')
        exitIcon = QIcon('/home/gargula/dotfiles/bin/icons/exit.png')

        font = QFont('Hack Nerd Font Propo', 19)
        button_1 = QPushButton("&Shutdown", self)
        button_1.clicked.connect(self.shutdown)
        button_1.setFont(font)
        button_1.setStyleSheet("border: 0px;")
        button_1.setIcon(shutdownIcon)
        button_1.setIconSize(QSize(64, 64))


        button_2 = QPushButton("&Reboot", self)
        button_2.clicked.connect(self.reboot)
        button_2.setFont(font)
        button_2.setStyleSheet("border: 0px;")
        button_2.setIcon(rebootIcon)
        button_2.setIconSize(QSize(64, 64))

        button_3 = QPushButton('&Logout', self)
        button_3.clicked.connect(self.logout)
        button_3.setFont(font)
        button_3.setStyleSheet("border: 0px;")
        button_3.setIcon(logoutIcon)
        button_3.setIconSize(QSize(64, 64))

        button_4 = QPushButton('&Exit', self)
        button_4.clicked.connect(self.exit)
        button_4.setFont(font)
        button_4.setStyleSheet("border: 0px;")
        button_4.setIcon(shutdownIcon)
        button_4.setIconSize(QSize(64, 64))

        # Create a QHBoxLayout instance
        layoutH = QHBoxLayout()


        layoutH.addWidget(button_1)
        layoutH.addWidget(button_2)
        layoutH.addWidget(button_3)
        layoutH.addWidget(button_4)

        central = QWidget()
        central.setLayout(layoutH)

        self.setCentralWidget(central)




    def shutdown(self):
        os.system("shutdown -h now")

    def reboot(self):
        os.system("reboot")

    def logout(self):
        os.system("bspc quit")

    def exit(self):
        sys.exit()


# Aplikacija
app = QApplication(sys.argv)


window = Window()

# Open the qss styles file and read in the CSS-like styling code
with open('/home/gargula/dotfiles/bin/QTDark.stylesheet', 'r') as f:
    style = f.read()

    # Set the stylesheet of the application
    app.setStyleSheet(style)

## Loop koji mora da stoji zadnji
window.show()
sys.exit(app.exec())

