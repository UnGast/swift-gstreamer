#include <gstreamer-1.0/gst/gst.h>
#include <glib-2.0/glib.h>
#include <stdio.h>

void test() {
  printf("TEST");
}

GstBin* bin_cast(GstElement* el) {
  return GST_BIN(el);
}