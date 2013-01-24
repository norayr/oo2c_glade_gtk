#include <gtk/gtk.h>
#include <glade/glade.h>

void Hello (GtkWidget *widget, gpointer user_data)
{ g_print("Hello, world!\n"); }

int main(int argc, char **argv)
{
  GladeXML *xml;

  gtk_init(&argc, &argv);
  xml = glade_xml_new("gui.glade", "window", NULL);
  if (!xml)
  { g_warning("unable to read or process xml file\n");
    return 1;
  }
  glade_xml_signal_autoconnect(xml);
  gtk_main();
  return 0;
}
