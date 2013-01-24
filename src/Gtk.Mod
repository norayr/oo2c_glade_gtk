(***************************************************************************
Project:     Gtk
Purpose:     Interface
Version:     2.0
Predecessor: GTK 1.1
Changes:     don't repeat 'gtk_' at the beginning of the names
Target:	     Linux
Compiler:    oo2c
Date:        jan 2009
Author:      Frank Hrebabetzky
***************************************************************************)

MODULE Gtk
  [INTERFACE "C"; LINK LIB "gtk-x11-2.0" ADD_OPTION LibGladePrefix END];

IMPORT G, Gdk, Pango;

CONST
  WINDOW_TOPLEVEL*      = 0;
  (* GtkAttachOptions *)
  EXPAND*               = 1;
  SHRINK*               = 2;
  FILL*                 = 4;
  (* GtkButtonsType *)
  BUTTONS_NONE*         = 0;
  BUTTONS_OK*           = 1;
  BUTTONS_CLOSE*        = 2;
  BUTTONS_CANCEL*       = 3;
  BUTTONS_YES_NO*       = 4;
  BUTTONS_OK_CANCEL*    = 5;
  (* GtkDialogFlags *)
  DIALOG_MODAL*         = 1;
  DIALOG_DESTROY_WITH_PARENT* = 2;
  DIALOG_NO_SEPARATOR*  = 4;
  (* GtkMessageType *)
  MESSAGE_INFO*         = 0;
  MESSAGE_WARNING*      = 1;
  MESSAGE_QUESTION*     = 2;
  MESSAGE_ERROR*        = 3;

TYPE
  Object* =   RECORD                     (* gtkobject.h *)
                parent_instance*:       G.Object;
                flags*:                 G.uint32
              END;
  RcStylePtr            = G.VoidPtr;
  Allocation            = Gdk.Rectangle;

  StylePtr*             = POINTER TO Style;
  Style* = RECORD                        (* gtkstyle.h *)
      parent_instance*:                         G.Object;
      fg*, bg*, light*, dark*, mid*, text*,
      base*, text_aa*:                          ARRAY 5 OF Gdk.Color;
      black*, white*:                           Gdk.Color;
      font_desc*:                               Pango.FontDescriptionPtr;
      xthickness*, ythickness*:                 G.int;
      fg_gc*, bg_gc*, light_gc*, dark_gc*,
      mid_gc*, text_gc*, base_gc*, text_aa_gc*: ARRAY 5 OF Gdk.CPtr;
      black_gc*, white_gc*:                     Gdk.CPtr;
      bg_pixmap*:                               ARRAY 5 OF Gdk.PixmapPtr;
      attach_count*, depth*:                    G.int;
      colormap*:                                Gdk.ColormapPtr;
      private_font*:                            Gdk.FontPtr;
      private_font_desc*:                       Pango.FontDescriptionPtr;
      rc_style*:                                RcStylePtr;
      styles*:                                  G.SListPtr;
      property_cache*:                          G.ArrayPtr;
      icon_factories*:                          G.SListPtr
    END;
    
  Requisition*  = RECORD                 (* gtkwidget.h *)
                    width*, height*:    G.int
                  END;

  WidgetPtr*    = POINTER TO Widget;
  Widget*       = RECORD                 (* gtkwidget.h *)
      object*:          Object;
      private_flags*:   G.uint16;
      state*:           G.uint8;
      saved_state*:     G.uint8;
      name*:            G.string;
      style*:           StylePtr;
      requisition*:     Requisition;
      allocation*:      Allocation;
      window*:          Gdk.WindowPtr;
      parent*:          WidgetPtr
    END;

  ArgVector* =  POINTER TO ARRAY OF POINTER TO ARRAY OF CHAR;

PROCEDURE ["gtk_init"] init* (VAR argc:LONGINT; VAR argv:ArgVector);
PROCEDURE ["gtk_main"] main*;

END Gtk.
