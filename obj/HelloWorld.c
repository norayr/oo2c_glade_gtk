#include <HelloWorld.d>
#include <__oo2c.h>
#include <setjmp.h>

void Hello(Gtk__WidgetPtr widget, OOC_PTR data) {

  Out__String((OOC_CHAR8*)"Hello, world!", 14);
  Out__Ln();
  return;
  ;
}

OOC_INT32 Draw(Gtk__WidgetPtr widget, OOC_PTR event, OOC_PTR data) {
  register OOC_INT64 i0,i1,i2,i3;
  OOC_INT32 a;

  i0 = (OOC_INT64)widget;
  i1 = *(OOC_INT32*)(((_check_pointer(i0, 964))+64)+8);
  i1 = i1>>1;
  a = i1;
  i2 = (OOC_INT64)*(OOC_INT64*)((_check_pointer(i0, 1026))+48);
  i3 = *(OOC_UINT8*)((_check_pointer(i0, 1049))+34);
  i0 = (OOC_INT64)*(OOC_INT64*)((_check_pointer(i0, 1011))+80);
  i2 = (OOC_INT64)*(OOC_INT64*)(((_check_pointer(i2, 1032))+544)+(_check_index(i3, 5, OOC_UINT16, 1038))*8);
  i3 = i1>>1;
  gdk_draw_arc((Gdk__DrawablePtr)i0, (void*)i2, 1, i3, i3, i1, i1, 0, 23040);
  return 1;
  ;
}

void OOC_HelloWorld_init(void) {
  register OOC_INT64 i0,i1;

  i0 = RT0__argc;
  i1 = (OOC_INT64)RT0__argv;
  HelloWorld__argc = i0;
  HelloWorld__argv = (Gtk__ArgVector)((OOC_INT64)_type_cast_fast(OOC_INT64, OOC_INT64, i1));
  gtk_init((void*)(OOC_INT64)&HelloWorld__argc, (void*)(OOC_INT64)&HelloWorld__argv);
  i0 = (OOC_INT64)glade_xml_new((OOC_CHAR8*)"gui.glade", (Glade__CString)(OOC_INT64)0, (Glade__CString)(OOC_INT64)0);
  HelloWorld__xml = (void*)i0;
  _assert((i0!=(OOC_INT64)0), 1, 1276);
  glade_xml_signal_autoconnect((void*)i0);
  i0 = (OOC_INT64)HelloWorld__xml;
  i0 = (OOC_INT64)glade_xml_get_widget((void*)i0, (OOC_CHAR8*)"drawing");
  HelloWorld__drawing = (Gtk__WidgetPtr)i0;
  _assert((i0!=(OOC_INT64)0), 2, 1393);
  gtk_main();
  return;
  ;
}

void OOC_HelloWorld_destroy(void) {
}

/* --- */
