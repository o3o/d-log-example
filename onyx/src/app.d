import std.stdio;

import onyx.log;
void main() {
	/* Build ConfBundle from config file */
   import onyx.bundle : Bundle;
	auto bundle = new immutable Bundle("./test.conf");

	/* Add loggers to "logger pool" */
	createLoggers(bundle);

	/* Get logger from "logger pool" */
	Log log = getLogger("ErrorLogger");

	/* send message to logger */
	log.error("error msg");

	auto logDebug = getLogger("DebugLogger");
	logDebug.debug_("debug msg");
	logDebug.info("info msg");
	logDebug.error("error!!!!!! msg");

   auto c = new Cul();
   c.prot("Homer");
}

class Cul {
   private Log log;
   this() {
      log = getLogger("AlarmLogger");
   }

   void prot(string who) {
      import std.string : format;
      log.info("%s eat ".format(who));
      log.error("prrooooot");
   }
}
