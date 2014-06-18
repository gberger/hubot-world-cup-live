# hubot-world-cup-live [![NPM version](https://badge.fury.io/js/hubot-world-cup-live.png)](http://badge.fury.io/js/hubot-world-cup-live)

A [Hubot](https://github.com/github/hubot) plugin that pushes World Cup goals to a chat room.

Powered by [http://worldcup.sfg.io/](http://worldcup.sfg.io/).

## Installation

1. Edit `package.json` and add `hubot-world-cup-live` as a dependency.
2. Add `"hubot-world-cup-live"` to your `external-scripts.json` file.
3. `npm install`
4. Set the `HUBOT_WORLD_CUP_DEFAULT_ROOM` environment variable
5. Reboot Hubot.

Now Hubot will check for new goals on the current match every few seconds.
Whenever a team scores, it will send a message to the configured room with the current score.

**Attention!** HipChat rooms are in the format id_name@conf.hipchat.com.
You can look at Hubot's logs to view what your desired room is called internally, or use [their API](https://www.hipchat.com/docs/api/method/rooms/list).
If you use another chat service, please consult its documentation.
