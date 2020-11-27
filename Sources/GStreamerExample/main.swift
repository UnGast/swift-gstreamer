import CGStreamer
import CGStreamerHelpers
import GStreamer

gst_init(nil, nil)

var loop = g_main_loop_new(nil, 0)

var pipeline = Pipeline()
var source = VideoTestSource()
var capsfilter = Capsfilter()
//var encoder = AVEncH263()
var sink = AppSink()

source.setPattern(.white)

pipeline.add(source)
pipeline.add(capsfilter)
pipeline.add(sink)

var caps = Caps(mediaType: "video/x-raw", format: "RGB", width: 10, height: 10)
capsfilter.setCaps(caps)

source.link(to: capsfilter)
capsfilter.link(to: sink)
//encoder.link(to: sink)

//var pipeline = gst_pipeline_new("audio-player")

/*var source = gst_element_factory_make("filesrc", "file-source")
var demuxer = gst_element_factory_make("oggdemux", "ogg-demuxer")
var decoder = gst_element_factory_make("vorbisdec", "vorbis-decoder")
var conv = gst_element_factory_make("audioconvert", "converter")*/
//var source = gst_element_factory_make("audiotestsrc", "audio-source")
//var sink = gst_element_factory_make("autoaudiosink", "audio-output")

/*var bin = bin_cast(pipeline)
gst_bin_add(bin, source)
gst_bin_add(bin, sink)*/

//gst_element_link(source, sink)

//gst_element_set_state(pipeline, GST_STATE_PLAYING)
try pipeline.play()

let sample = sink.pullSample()
let buffer = sample.getBuffer()
let mapInfo = buffer.getMap()

print("HERE1", sample, buffer, mapInfo, mapInfo.data)

//let data = UnsafeRawBufferPointer()

//g_main_loop_run(loop)

print("HERE")
/*
while true {

}*/

try pipeline.setState(.null)

//g_main_loop_unref(loop)

