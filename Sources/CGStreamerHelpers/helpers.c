#include <gstreamer-1.0/gst/gst.h>
#include <gstreamer-1.0/gst/gstsample.h>
#include <gstreamer-1.0/gst/app/app.h>
#include <gstreamer-1.0/gst/app/app-prelude.h>
#include <gstreamer-1.0/gst/app/app-enumtypes.h>
#include <gstreamer-1.0/gst/app/gstappsink.h>
#include <glib-2.0/glib.h>
#include <glib-2.0/glib-object.h>
#include <stdbool.h>
#include <stdint.h>

#include "include/types.h"

GstBin* bin_cast(GstElement* el) {
  return GST_BIN(el);
}

GstPipeline* pipeline_cast(GstElement* el) {
  return GST_PIPELINE(el);
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

GValue new_gvalue_uint32(const uint32_t value) {
  GValue gvalue = G_VALUE_INIT;
  g_value_init(&gvalue, G_TYPE_UINT);
  g_value_set_uint(&gvalue, value);
  return gvalue;
}

GValue new_gvalue_bool(const bool value) {
  GValue gvalue = G_VALUE_INIT;
  g_value_init(&gvalue, G_TYPE_BOOLEAN);
  g_value_set_boolean(&gvalue, value ? 1 : 0);
  return gvalue;
}

GValue new_gvalue_fraction(const int numerator, const int denominator) {
  GValue gvalue = G_VALUE_INIT;
  g_value_init(&gvalue, GST_TYPE_FRACTION);
  gst_value_set_fraction(&gvalue, numerator, denominator);
  return gvalue;
}

void set_gst_element_struct_field(GstElement* el, const char* name, struct any_object* value) {
  g_object_set(G_OBJECT(el), name, value);
}

GstSample* get_gst_app_sink_sample(GstElement* sink) {
  return gst_app_sink_pull_sample(GST_APP_SINK_CAST(sink));
}

GstSample* get_gst_app_sink_sample_timeout(GstElement* sink, const double timeout) {
  return gst_app_sink_try_pull_sample(GST_APP_SINK_CAST(sink), (uint64_t) (timeout * 1000 * 1000));
}

int get_gst_message_type(GstMessage* message) {
  return GST_MESSAGE_TYPE(message);
}