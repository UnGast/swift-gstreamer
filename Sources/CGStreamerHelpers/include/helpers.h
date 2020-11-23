#include <gstreamer-1.0/gst/gst.h>
#include <glib-2.0/glib.h>
#include <glib-2.0/glib-object.h>
#include <stdbool.h>

void test();

GstBin* bin_cast(GstElement* el);

GstObject* object_cast(GstElement* el);

GObject* gobject_cast(GstElement *object);

GValue new_gvalue();

GValue new_gvalue_string(const gchararray content);

GValue new_gvalue_int(const int content);

GValue new_gvalue_bool(const bool value);