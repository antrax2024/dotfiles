#!/usr/bin/python

from PyQt6.QtGui import *
from PyQt6.QtWidgets import *
from PyQt6.QtCore import *
import sys
import os

class Window(QMainWindow):
    def __init__(self):
        super().__init__()
        self.resize(300, 400)
        self.setWindowTitle("powermenu")

        button_1 = QPushButton("Shutdown", self)
        button_1.clicked.connect(self.shutdown)

        button_2 = QPushButton("Reboot", self)
        button_2.clicked.connect(self.reboot)

        button_3 = QPushButton('Logout', self)
        button_3.clicked.connect(self.logout)


        button_4 = QPushButton('&Exit', self)
        button_4.clicked.connect(self.exit)

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
        os.system("loginctl terminate-session ${XDG_SESSION_ID-}")

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

