#include <gstreamer-1.0/gst/gst.h>
#include <glib-2.0/glib.h>
#include <glib-2.0/glib-object.h>
#include <stdio.h>
#include <stdbool.h>

void test() {
  printf("TEST");
}

GstBin* bin_cast(GstElement* el) {
  return GST_BIN(el);
}

GstObject* object_cast(GstElement* el) {
  return GST_OBJECT(el);
}

GObject* gobject_cast(GObject *object) {
  return G_OBJECT(object);
}

GValue new_gvalue() {
  GValue value = G_VALUE_INIT;
  return value;
}

GValue new_gvalue_string(const gchararray value) {
  GValue gvalue = G_VALUE_INIT;
  // need to duplicate because the original swift pointer will be deallocated by swift
  gchararray dup = g_strdup(value);
  g_value_init(&gvalue, G_TYPE_STRING);
  g_value_set_static_string(&gvalue, dup);
  return gvalue;
}

GValue new_gvalue_int(const int value) {
  GValue gvalue = G_VALUE_INIT;
  g_value_init(&gvalue, G_TYPE_INT);
  g_value_set_int(&gvalue, value);
  return gvalue;
}

GValue new_gvalue_bool(const bool value) {
  GValue gvalue = G_VALUE_INIT;
  g_value_init(&gvalue, G_TYPE_BOOLEAN);
  g_value_set_boolean(&gvalue, value ? 1 : 0);
  return gvalue;
}