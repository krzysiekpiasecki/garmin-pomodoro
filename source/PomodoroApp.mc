import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class PomodoroApp extends Application.AppBase {
    var model as PomodoroModel;

    function initialize() {
        AppBase.initialize();
        model = new PomodoroModel();
    }

    function onStop(state as Dictionary?) as Void {
        model.stop();
    }

    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [new PomodoroView(model), new PomodoroDelegate(model)];
    }
}
