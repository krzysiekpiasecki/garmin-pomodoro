import Toybox.Attention;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.WatchUi;

enum Phase {
    PHASE_WORK,
    PHASE_SHORT_BREAK,
    PHASE_LONG_BREAK
}

class PomodoroModel {
    const WORK_SECONDS = 25 * 60;
    const SHORT_BREAK_SECONDS = 5 * 60;
    const LONG_BREAK_SECONDS = 15 * 60;
    const SESSIONS_BEFORE_LONG_BREAK = 4;

    var phase as Phase = PHASE_WORK;
    var remaining as Number = WORK_SECONDS;
    var completedSessions as Number = 0;
    var running as Boolean = false;
    private var _timer as Timer.Timer = new Timer.Timer();

    function toggle() as Void {
        if (running) {
            stop();
        } else {
            running = true;
            _timer.start(method(:onTick), 1000, true);
        }
        WatchUi.requestUpdate();
    }

    function stop() as Void {
        running = false;
        _timer.stop();
    }

    function reset() as Void {
        stop();
        phase = PHASE_WORK;
        remaining = WORK_SECONDS;
        completedSessions = 0;
        WatchUi.requestUpdate();
    }

    function onTick() as Void {
        remaining -= 1;
        if (remaining <= 0) {
            nextPhase();
        }
        WatchUi.requestUpdate();
    }

    function nextPhase() as Void {
        notify();
        if (phase == PHASE_WORK) {
            completedSessions += 1;
            if (completedSessions % SESSIONS_BEFORE_LONG_BREAK == 0) {
                phase = PHASE_LONG_BREAK;
                remaining = LONG_BREAK_SECONDS;
            } else {
                phase = PHASE_SHORT_BREAK;
                remaining = SHORT_BREAK_SECONDS;
            }
        } else {
            phase = PHASE_WORK;
            remaining = WORK_SECONDS;
        }
    }

    private function notify() as Void {
        if (Attention has :vibrate) {
            Attention.vibrate([new Attention.VibeProfile(100, 500)]);
        }
    }
}
