from PyQt5.QtWidgets import QApplication, QLabel
from PyQt5 import uic
from sys import argv

Form, Window = uic.loadUiType("MainWindow.ui")

app = QApplication(argv)
window = Window()
form = Form()
form.setupUi(window)
window.show()
app.exec_()
