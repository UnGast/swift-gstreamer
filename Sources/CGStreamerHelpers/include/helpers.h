#include <gstreamer-1.0/gst/gst.h>
//#include <gstreamer-1.0/gst/gstsample.h>
#include <gstreamer-1.0/gst/app/app.h>
//#include <gstreamer-1.0/gst/app/app-prelude.h>
//#include <gstreamer-1.0/gst/app/app-enumtypes.h>
#include <gstreamer-1.0/gst/app/gstappsink.h>
//#include <gst.h>
#include <glib-2.0/glib.h>
#include <glib-2.0/glib-object.h>
#include <stdbool.h>
#include "types.h"
#include <stdint.h>

GstBin* bin_cast(GstElement* el);

GstPipeline* pipeline_cast(GstElement* el);

GstObject* object_cast(GstElement* el);

GObject* gobject_cast(GstElement *object);

GValue new_gvalue();

GValue new_gvalue_string(const gchararray value);

GValue new_gvalue_int(const int value);

GValue new_gvalue_uint32(const uint32_t value);

GValue new_gvalue_bool(const bool value);

GValue new_gvalue_fraction(const int numerator, const int denominator);

void set_gst_element_struct_field(GstElement* el, const char* name, struct any_object* value);

GstSample* get_gst_app_sink_sample(GstElement* sink);

GstSample* get_gst_app_sink_sample_timeout(GstElement* sink, const double timeout);

int get_gst_message_type(GstMessage* message);