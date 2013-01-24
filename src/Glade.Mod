(***************************************************************************
Project:     Glade
Purpose:     Interface
Version:     1.0
Predecessor: -
Changes:     -
Target:	     Linux
Compiler:    oo2c
Date:        jan 2009
Author:      Frank Hrebabetzky
***************************************************************************)

MODULE Glade
  [INTERFACE "C"; LINK LIB "glade-2.0" ADD_OPTION LibGladePrefix END];

IMPORT
  SYSTEM, Gtk;

TYPE
  XMLPtr* =     SYSTEM.PTR;
  CString* =    POINTER [CSTRING] TO ARRAY OF CHAR;

PROCEDURE ["glade_xml_new"] xml_new*
        (fname,root,domain:CString): XMLPtr;
PROCEDURE ["glade_xml_signal_autoconnect"] xml_signal_autoconnect*
        (self:XMLPtr);
PROCEDURE ["glade_xml_get_widget"] xml_get_widget*
        (self:XMLPtr; name:CString): Gtk.WidgetPtr;

END Glade.
