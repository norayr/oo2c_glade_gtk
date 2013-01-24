(***************************************************************************
Project:     HelloWorld
Purpose:     A libglade-Hello-World with oo2c
Version:     1.0
Predecessor: -
Changes:     -
Target:	     Linux
Compiler:    oo2c
Date:        Jan. 2009
Author:      Frank Hrebabetzky
***************************************************************************)

MODULE HelloWorld;

IMPORT
  SYSTEM, RT0, Out, G, Gdk, Gtk, Glade;

CONST
  GUIFILE =     "gui.glade";
  ERRXML =      1;              (* xml file problem *)
  ERRNOTFOUND = 2;              (* widget not found *)

VAR
  argc :        LONGINT;
  argv :        Gtk.ArgVector;
  xml:          Glade.XMLPtr;
  drawing:      Gtk.WidgetPtr;


PROCEDURE ["Hello"] Hello* (widget:Gtk.WidgetPtr; data:SYSTEM.PTR);
BEGIN
  Out.String("Hello, world!");   Out.Ln;
END Hello;


PROCEDURE ["Draw"] Draw* (widget:Gtk.WidgetPtr;
  event:Gdk.EventExposePtr; data:G.pointer): G.boolean;
VAR a: G.int;
BEGIN
  a:= widget.allocation.width DIV 2;
  Gdk.draw_arc (widget.window, widget.style.fg_gc[ORD(widget.state)], G.TRUE,
  a DIV 2, a DIV 2, a, a, 0, 64*360);
  RETURN G.TRUE;
END Draw;


BEGIN
  argc:= RT0.argc;
  argv:= SYSTEM.VAL (Gtk.ArgVector, RT0.argv);
  Gtk.init (argc, argv);
  xml:= Glade.xml_new (GUIFILE, NIL, NIL);
  ASSERT (xml#NIL, ERRXML);
  Glade.xml_signal_autoconnect (xml);
  drawing:= Glade.xml_get_widget (xml, "drawing");
  ASSERT (drawing#NIL, ERRNOTFOUND);
  Gtk.main;
END HelloWorld.
