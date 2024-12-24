import keyboard as kb
import pyautogui as gui
import time

def spam():
    if kb.is_pressed("h"):
        while True:
            gui.leftClick()
            if kb.is_pressed("y"):
                break

def speed():
    if kb.is_pressed("h"):
        gui.keyDown("c")
        kb.press('a,s')
        gui.mouseDown(button='right')
        while True:
            gui.keyUp("c")
            time.sleep(0.1228)
            gui.keyDown("c")
            if kb.is_pressed("y"):
                kb.release("a,s")
                gui.keyUp("c")
                gui.mouseUp(button='right')
                break
            
while True:
    #kb.wait("g")
    #gui.hotkey("ctrl", "shift","left")
    #gui.hotkey("ctrl", "c")
    #price = float(pyperclip.paste())
    #price += 0.50
    #gui.write("12.50")
    #gui.press("tab")
    #gui.write("12.50")
    #for i in range(6):
    #    gui.press("tab")
    #gui.press("enter")h
    #gui.mouseDown()
    #kb.wait("e")
   # gui.mouseUp()
    #if kb.is_pressed("v"):
        #for i in range(0,100):
            #if kb.is_pressed("e"):
            #    break
            #gui.click()
    spam()
