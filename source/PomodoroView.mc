import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class PomodoroView extends WatchUi.View {
    private var _model as PomodoroModel;

    function initialize(model as PomodoroModel) {
        View.initialize();
        _model = model;
    }

    function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var w = dc.getWidth();
        var h = dc.getHeight();
        var minutes = _model.remaining / 60;
        var seconds = _model.remaining % 60;

        var label = WatchUi.loadResource(Rez.Strings.Work);
        if (_model.phase == PHASE_SHORT_BREAK) {
            label = WatchUi.loadResource(Rez.Strings.ShortBreak);
        } else if (_model.phase == PHASE_LONG_BREAK) {
            label = WatchUi.loadResource(Rez.Strings.LongBreak);
        }

        dc.drawText(w / 2, h * 0.2, Graphics.FONT_MEDIUM, label, Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(w / 2, h / 2, Graphics.FONT_NUMBER_HOT,
            Lang.format("$1$:$2$", [minutes.format("%02d"), seconds.format("%02d")]),
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(w / 2, h * 0.75, Graphics.FONT_SMALL,
            "#" + _model.completedSessions, Graphics.TEXT_JUSTIFY_CENTER);
    }
}
