class Collection {

  public: void *Get(void *_object) { return NULL; }

};



class Timer      {

  protected:

    string name;

    uint start, end;

  public:

    void Timer(string _name = "") : name(_name) { };

    void TimerStart() { start = GetTickCount(); }

    void TimerStop()  { end = GetTickCount();   }

};



class Profiler {

  public:

    static Collection *timers;

    static ulong min_time;

    void Profiler()  { };

    void ~Profiler() { Deinit(); };

    static void Deinit() { delete Profiler::timers; };

};



// Initialize static global variables.

Collection *Profiler::timers = new Collection();

ulong Profiler::min_time = 1;



void main() {

  // Define local variable.

  static Timer *_timer = new Timer(__FUNCTION__); // This line doesn't.

  //Timer *_timer = new Timer(__FUNCTION__); // This line works.



  // Start a timer.

  ((Timer *) Profiler::timers.Get(_timer)).TimerStart();

  /* Some code here. */

  // Stop a timer.

  ((Timer *) Profiler::timers.Get(_timer)).TimerStop();

}