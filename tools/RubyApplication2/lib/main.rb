#!/usr/bin/env ruby
require 'gtk2'

# Copy the selected text to the clipboard and remove it from the buffer.
def cut_clicked (txtvu)
  clipboard = Gtk::Clipboard.get(Gdk::Selection::CLIPBOARD)
  txtvu.buffer.cut_clipboard(clipboard, true)
end
# Copy the selected text to the clipboard.
def copy_clicked (txtvu)
  clipboard = Gtk::Clipboard.get(Gdk::Selection::CLIPBOARD)
  txtvu.buffer.copy_clipboard(clipboard)
end
# Insert the text from the clipboard into the text buffer.
def paste_clicked (txtvu)
  clipboard = Gtk::Clipboard.get(Gdk::Selection::CLIPBOARD)
  txtvu.buffer.paste_clipboard(clipboard, nil, true)
end

window = Gtk::Window.new(Gtk::Window::TOPLEVEL)
window.resizable = true
window.title = "Cut, Copy & Paste"
window.border_width = 10
window.signal_connect('delete_event') { Gtk.main_quit }

textview = Gtk::TextView.new

cut    = Gtk::Button.new(Gtk::Stock::CUT)
copy   = Gtk::Button.new(Gtk::Stock::COPY)
paste  = Gtk::Button.new(Gtk::Stock::PASTE)
cut.signal_connect('clicked') { cut_clicked(textview) }
copy.signal_connect('clicked') { copy_clicked(textview) }
paste.signal_connect('clicked') { paste_clicked(textview) }

scrolled_win = Gtk::ScrolledWindow.new
scrolled_win.set_size_request(300, 200)
scrolled_win.add(textview)

hbox = Gtk::HBox.new(true, 5)
hbox.pack_start(cut,   true, true, 0)
hbox.pack_start(copy,  true, true, 0)
hbox.pack_start(paste, true, true, 0)
vbox = Gtk::VBox.new(false, 5)
vbox.pack_start(scrolled_win, true,  true, 0)
vbox.pack_start(hbox,         false, true, 0)

window.add(vbox)
window.show_all
Gtk.main