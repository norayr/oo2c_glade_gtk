(***************************************************************************
Project:     Pango
Purpose:     Interface
Version:     2.0
Predecessor: 
Changes:     don't repeat 'g_' at the beginning of the names, change some
Target:	     Linux
Compiler:    oo2c
Date:        jan 2009
Author:      Frank Hrebabetzky
***************************************************************************)

MODULE Pango
  [INTERFACE "C"; LINK LIB "pango-1.0" ADD_OPTION LibGTKPrefix END];

IMPORT G;

CONST
  SCALE* =              1024;

TYPE
  ContextPtr* =         G.VoidPtr;
  FontDescriptionPtr* = G.VoidPtr;
  FontPtr* =            G.VoidPtr;
  LanguagePtr* =        G.VoidPtr;
  LayoutPtr* =          G.VoidPtr;

  FontMetricsPtr* =   POINTER TO FontMetrics;
  FontMetrics* =      RECORD
                        ref_count*:                     G.uint;
                        ascent*, descent*,
                        approximate_char_width*,
                        approximate_digit_width*:       G.int
                      END;
  
  RectanglePtr* =     POINTER TO Rectangle;
  Rectangle* =        RECORD
                        x*, y*, width*, height*: G.int
                      END;

PROCEDURE ["pango_context_get_metrics"] context_get_metrics*
  (context:ContextPtr; desc:FontDescriptionPtr; language:LanguagePtr):
  FontMetricsPtr;
PROCEDURE ["pango_font_description_from_string"] font_description_from_string*
  (str:G.string): FontDescriptionPtr;
PROCEDURE ["pango_font_get_metrics"] font_get_metrics*
  (font:FontPtr; language:LanguagePtr): FontMetricsPtr;
PROCEDURE ["pango_font_metrics_unref"] font_metrics_unref*
  (metrics:FontMetricsPtr);
PROCEDURE ["pango_layout_get_pixel_extents"] layout_get_pixel_extents*
  (layout:LayoutPtr; VAR ink_rect,logical_rect:Rectangle);
PROCEDURE ["pango_layout_get_pixel_size"] layout_get_pixel_size*
  (layout:LayoutPtr; VAR width,height:G.int);
PROCEDURE ["pango_layout_set_font_description"] layout_set_font_description*
  (layout:LayoutPtr; desc:FontDescriptionPtr);
PROCEDURE ["pango_layout_set_text"] layout_set_text*
  (layout:LayoutPtr; text:G.string; length:G.int);

END Pango.

