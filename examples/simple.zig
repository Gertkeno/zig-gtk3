const std = @import("std");
const gtk = @import("gtk");

pub fn main() !void {
    const app = gtk.gtk_application_new("org.gtk.example", .G_APPLICATION_FLAGS_NONE) orelse @panic("null app :(");
    defer gtk.g_object_unref(app);

    _ = gtk.g_signal_connect_data(
        app,
        "activate",
        @ptrCast(gtk.GCallback, activate),
        null,
        null,
        gtk.connect_after,
    );
    _ = gtk.g_application_run(@ptrCast(*gtk.GApplication, app), 0, null);
}

fn activate(app: *gtk.GtkApplication, data: gtk.gpointer) void {
    const window = gtk.ApplicationWindow.new(app).as_window();
    window.set_title("Example Program");
    window.set_default_size(400, 400);
    window.as_widget().show_all();
}
