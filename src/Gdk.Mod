(***************************************************************************
Project:     Gdk
Purpose:     Interface
Version:     2.0
Predecessor: GTK
Changes:     don't repeat 'g_' at the beginning of the names, change some
Target:	     Linux
Compiler:    oo2c
Date:        jan 2009
Author:      Frank Hrebabetzky
***************************************************************************)

MODULE Gdk
  [INTERFACE "C"; LINK LIB "gdk-x11-2.0" ADD_OPTION LibGladePrefix END];

IMPORT G, Pango;

CONST
  GRAVITY_NORTH_WEST*           = 1;
  HINT_MIN_SIZE*                = 2;
  
  (* GdkFunction *)
  COPY*                         = 00H;
  INVERT*                       = 01H;
  XOR*                          = 02H;
  CLEAR*                        = 03H;
  AND*                          = 04H;
  AND_REVERSE*                  = 05H;
  AND_INVERT*                   = 06H;
  NOOP*                         = 07H;
  Or*                           = 08H;
  EQUIV*                        = 09H;
  OR_REVERSE*                   = 0AH;
  COPY_INVERT*                  = 0BH;
  OR_INVERT*                    = 0CH;
  NAND*                         = 0DH;
  SET*                          = 0EH;

  (* GdkCapStyle *)
  CAP_NOT_LAST*                 = 0;
  CAP_BUTT*                     = 1;
  CAP_ROUND*                    = 2;
  CAP_PROJECTING*               = 3;

  (* GdkJoinStyle *)
  JOIN_MITER*                   = 0;
  JOIN_ROUND*                   = 1;
  JOIN_BEVEL*                   = 2;

  (* GdkLineStyle *)
  LINE_SOLID*                   = 0;
  LINE_ON_OFF_DASH*             = 1;
  LINE_DOUBLE_DASH*             = 2;

TYPE
  ColormapPtr*          = G.VoidPtr;
  EventPtr*             = G.VoidPtr;
  EventExposePtr*       = G.VoidPtr;
  FontPtr*              = G.VoidPtr;
  CPtr*                 = G.VoidPtr;
  ImagePtr*             = G.VoidPtr;
  PixmapPtr*            = G.VoidPtr;

  ColorPtr* = POINTER TO Color;
  Color* =    RECORD
                pixel* :                G.uint32;
                red*, green*, blue*:    G.uint16;
              END;

  DrawablePtr* = POINTER TO Drawable;
  Drawable* = RECORD                     (* gdkdrawable.h *)
                parent_instance*:       G.Object
              END;
  
  GCValuesPtr* = POINTER TO GCValues;
  GCValues* = RECORD
                foreground*, background*:               Color;
                font*:                                  FontPtr;
                function*, fill*:                       G.int;
                tile*, stipple*, clip_mask*:            PixmapPtr;
                subwindow_mode*,
                ts_x_origin*, ts_y_origin*,
                clip_x_origin*, clip_y_origin*,
                graphics_exposures*, line_width*,
                line_style*, cap_style*, join_style*:   G.int
              END;
  
  GeometryPtr* = POINTER TO Geometry;
  Geometry* = RECORD
                min_width*, min_height*,
                max_width*, max_height*,
                base_width*, base_height*,
                width_inc*, height_inc*:        G.int;
                min_aspect*, max_aspect*:       G.double;
                win_gravity*:                   G.int;
              END;

  RectanglePtr* = POINTER TO Rectangle;
  Rectangle*= RECORD                     (* gdktypes.h *)
                x*, y*, width*, height*:        G.int
              END;
  
  Window* =     Drawable;                (* gdktypes.h *)
  WindowPtr* =  DrawablePtr;


PROCEDURE ["gdk_colormap_alloc_color"] colormap_alloc_color*
  (colormap:ColormapPtr; color:ColorPtr;
  writeable,best_match:G.boolean): G.boolean;
PROCEDURE ["gdk_colormap_get_system"] colormap_get_system* (): ColormapPtr;
PROCEDURE ["gdk_draw_arc"] draw_arc* (drawable:DrawablePtr; gc:CPtr;
        filled:G.boolean; x,y,width,height,angle1,angle2:G.int);
PROCEDURE ["gdk_draw_image"] draw_image* (drawable:DrawablePtr;
  gc:CPtr; image:ImagePtr; xsrc,ysrc,xdest,ydest,width,height:G.int);
PROCEDURE ["gdk_draw_layout"] draw_layout* (drawable:DrawablePtr;
  gc:CPtr; x,y:G.int; layout:Pango.LayoutPtr);
PROCEDURE ["gdk_draw_line"] draw_line* (drawable:DrawablePtr;
  gc:CPtr; x1,y1,x2,y2:G.int);
PROCEDURE ["gdk_draw_point"] draw_point* (drawable:DrawablePtr;
  gc:CPtr; x,y:G.int);
PROCEDURE ["gdk_draw_rectangle"] draw_rectangle* (drawable:DrawablePtr;
  gc:CPtr; filled:G.boolean; x,y,width,height:G.int);
PROCEDURE ["gdk_drawable_get_image"] drawable_get_image* (drawable:DrawablePtr;
        x,y,width,height:G.int): ImagePtr;
PROCEDURE ["gdk_gc_get_values"] gc_get_values* (gc:CPtr; VAR values:GCValues);
PROCEDURE ["gdk_gc_new"] gc_new* (drawable:DrawablePtr): CPtr;
PROCEDURE ["gdk_gc_set_background"] gc_set_background*
  (gc:CPtr; color:ColorPtr);
PROCEDURE ["gdk_gc_set_clip_origin"] gc_set_clip_origin* (gc:CPtr; x,y:G.int);
PROCEDURE ["gdk_gc_set_clip_rectangle"] gc_set_clip_rectangle*
  (gc:CPtr; rectangle:RectanglePtr);
PROCEDURE ["gdk_gc_set_foreground"] gc_set_foreground*
  (gc:CPtr; color:ColorPtr);
PROCEDURE ["gdk_gc_set_function"] gc_set_function* (gc:CPtr; function:G.int);
PROCEDURE ["gdk_gc_set_line_attributes"] gc_set_line_attributes*
  (gc:CPtr; line_width,line_style,cap_style,join_style:G.int); 
PROCEDURE ["gdk_gc_set_rgb_fg_color"] gc_set_rgb_fg_color*
  (gc:CPtr; color:ColorPtr);
PROCEDURE ["gdk_gc_set_rgb_bg_color"] gc_set_rgb_bg_color*
  (gc:CPtr; color:ColorPtr);
PROCEDURE ["gdk_image_get_pixel"] image_get_pixel*
  (image:ImagePtr; x,y:G.int): G.uint32;
PROCEDURE ["gdk_image_put_pixel"] image_put_pixel*
  (image:ImagePtr; x,y:G.int; pixel:G.uint32);
PROCEDURE ["gdk_pixmap_new"] pixmap_new*
  (drawable:DrawablePtr; width,height,depth:G.int): PixmapPtr;

END Gdk.

