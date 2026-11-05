import Toybox.Lang;
import Toybox.WatchUi;

class PomodoroDelegate extends WatchUi.BehaviorDelegate {
    private var _model as PomodoroModel;

    function initialize(model as PomodoroModel) {
        BehaviorDelegate.initialize();
        _model = model;
    }

    // START/STOP button or screen tap
    function onSelect() as Boolean {
        _model.toggle();
        return true;
    }

    // Long-press UP / menu resets the session
    function onMenu() as Boolean {
        _model.reset();
        return true;
    }
}
