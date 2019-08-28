from PyQt5.QtWidgets import QApplication, QLabel
from sys import argv

app = QApplication(argv)

label = QLabel('Hello World!')
label.show()
app.exec_()
