#include <HelloWorld.oh>
#include <RT0.oh>
#include <Out.oh>
#include <Glade.oh>
#define HelloWorld__GUIFILE (OOC_CHAR8[])"gui.glade"
#define HelloWorld__ERRXML 1
#define HelloWorld__ERRNOTFOUND 2
static OOC_INT32 HelloWorld__argc;
static Gtk__ArgVector HelloWorld__argv;
static OOC_PTR HelloWorld__xml;
static Gtk__WidgetPtr HelloWorld__drawing;

/* run-time meta data */
static RT0__ModuleDesc _mid;
static RT0__ModuleDesc _mid = { (OOC_CHAR8*)"HelloWorld", (RT0__Struct[]) { NULL }, 0 };

extern void OOC_HelloWorld_open(RT0__Module client) {
  if (_mid.openCount == 0) {
    OOC_RT0_open(&_mid);
    OOC_Out_open(&_mid);
    OOC_RT0_open(&_mid);
    OOC_Object_open(&_mid);
    OOC_Exception_open(&_mid);

    RT0__RegisterModule(&_mid);
    OOC_HelloWorld_init();
  }
  _mid.openCount++;
}
extern void OOC_HelloWorld_close(RT0__Module client) {
  _mid.openCount--;
  if (_mid.openCount == 0) { 
    OOC_HelloWorld_destroy();
    RT0__UnregisterModule(&_mid);

    OOC_RT0_close(&_mid);
    OOC_Out_close(&_mid);
    OOC_RT0_close(&_mid);
    OOC_Object_close(&_mid);
    OOC_Exception_close(&_mid);
  }
}

/* --- */
