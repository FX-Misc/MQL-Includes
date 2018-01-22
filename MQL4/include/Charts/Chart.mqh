//+------------------------------------------------------------------+
//|                                                       Chart.mqh  |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum ENUM_CHART_MODE
  {
//   CHART_BARS,
//   CHART_CANDLES,
//   CHART_LINE            // пересечение
  };
enum ENUM_CHART_VOLUME_MODE
  {
   CHART_VOLUME_HIDE,
   CHART_VOLUME_TICK,
   CHART_VOLUME_REAL
  };
enum ENUM_CHART_POSITION
  {
   CHART_BEGIN,
   CHART_CURRENT_POS,
   CHART_END
  };
//+------------------------------------------------------------------+
#include <Object.mqh>
//+------------------------------------------------------------------+
//| Class CChart.                                                    |
//| Purpose: Class of the "Chart" object.                            |
//|          Derives from class CObject.                             |
//+------------------------------------------------------------------+
class CChart : public CObject
  {
protected:
   long              m_chart_id;           // chart identifier
public:
                     CChart(void);
                    ~CChart(void);
   //--- methods of access to protected data
   long              ChartId(void) const { return(m_chart_id); }
   //--- method of identifying the object
   virtual int       Type(void) const { return(0x1111); }
   //--- methods of access to properties of the chart
   //--- common properties
   ENUM_CHART_MODE   Mode(void) const;
   bool              Mode(const ENUM_CHART_MODE mode) const;
   bool              Foreground(void) const;
   bool              Foreground(const bool foreground) const;
   bool              Shift(void) const;
   bool              Shift(const bool shift) const;
   double            ShiftSize(void) const;
   bool              ShiftSize(double shift) const;
   bool              AutoScroll(void) const;
   bool              AutoScroll(const bool auto_scroll) const;
   int               Scale(void) const;
   bool              Scale(int scale) const;
   bool              ScaleFix(void) const;
   bool              ScaleFix(const bool scale_fix) const;
   bool              ScaleFix_11(void) const;
   bool              ScaleFix_11(const bool scale_fix_11) const;
   double            FixedMax(void) const;
   bool              FixedMax(const double fixed_max) const;
   double            FixedMin(void) const;
   bool              FixedMin(const double fixed_min) const;
   bool              ScalePPB(void) const;
   bool              ScalePPB(const bool scale_ppb) const;
   double            PointsPerBar(void) const;
   bool              PointsPerBar(const double points_per_bar) const;
   //--- show properties
   bool              ShowOHLC(void) const;
   bool              ShowOHLC(const bool show) const;
   bool              ShowLineBid(void) const;
   bool              ShowLineBid(const bool show) const;
   bool              ShowLineAsk(void) const;
   bool              ShowLineAsk(const bool show) const;
   bool              ShowLastLine(void) const;
   bool              ShowLastLine(const bool show) const;
   bool              ShowPeriodSep(void) const;
   bool              ShowPeriodSep(const bool show) const;
   bool              ShowGrid(void) const;
   bool              ShowGrid(const bool show) const;
   ENUM_CHART_VOLUME_MODE ShowVolumes(void) const;
   bool              ShowVolumes(const ENUM_CHART_VOLUME_MODE show) const;
   bool              ShowObjectDescr(void) const;
   bool              ShowObjectDescr(const bool show) const;
   bool              ShowDateScale(const bool show) const;
   bool              ShowPriceScale(const bool show) const;
   //--- color properties
   color             ColorBackground(void) const;
   bool              ColorBackground(const color new_color) const;
   color             ColorForeground(void) const;
   bool              ColorForeground(const color new_color) const;
   color             ColorGrid(void) const;
   bool              ColorGrid(const color new_color) const;
   color             ColorBarUp(void) const;
   bool              ColorBarUp(const color new_color) const;
   color             ColorBarDown(void) const;
   bool              ColorBarDown(const color new_color) const;
   color             ColorCandleBull(void) const;
   bool              ColorCandleBull(const color new_color) const;
   color             ColorCandleBear(void) const;
   bool              ColorCandleBear(const color new_color) const;
   color             ColorChartLine(void) const;
   bool              ColorChartLine(const color new_color) const;
   color             ColorVolumes(void) const;
   bool              ColorVolumes(const color new_color) const;
   color             ColorLineBid(void) const;
   bool              ColorLineBid(const color new_color) const;
   color             ColorLineAsk(void) const;
   bool              ColorLineAsk(const color new_color) const;
   color             ColorLineLast(void) const;
   bool              ColorLineLast(const color new_color) const;
   color             ColorStopLevels(void) const;
   bool              ColorStopLevels(const color new_color) const;
   //--- other properties
   bool              BringToTop(void) const;
   bool              EventObjectCreate(const bool flag=true) const;
   bool              EventObjectDelete(const bool flag=true) const;
   bool              EventMouseMove(const bool flag=true) const;
   bool              MouseScroll(const bool flag=true) const;
   //--- methods of access to READ ONLY properties of the chart
   int               VisibleBars(void) const;
   int               WindowsTotal(void) const;
   bool              WindowIsVisible(const int num) const;
   int               WindowHandle(void) const;
   int               FirstVisibleBar(void) const;
   int               WidthInBars(void) const;
   int               WidthInPixels(void) const;
   int               HeightInPixels(const int num) const;
   int               SubwindowY(const int num) const;
   double            PriceMin(const int num) const;
   double            PriceMax(const int num) const;
   bool              IsObject(void) const { return(false); }
   //--- methods of binding chart
   void              Attach(void) { m_chart_id=ChartID(); }
   void              Attach(const long chart) { m_chart_id=chart; }
   void              Detach(void) { m_chart_id=-1;                    }
   //--- methods of access to the API functions of MQL5
   string            Symbol(void) const { return(::Symbol()); }
   ENUM_TIMEFRAMES   Period(void) const { return((ENUM_TIMEFRAMES)::Period()); }    // ??? совместимость
   void              Redraw(void) const { ChartRedraw(m_chart_id); }
   bool              ScreenShot(const string filename,const int width,const int height,
                                const ENUM_ALIGN_MODE align_mode=ALIGN_RIGHT) const;
   int               WindowOnDropped(void) const;
   double            PriceOnDropped(void) const;
   datetime          TimeOnDropped(void) const;
   int               XOnDropped(void) const;
   int               YOnDropped(void) const;
  };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CChart::CChart(void) : m_chart_id(-1)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CChart::~CChart(void)
  {
  }
//+------------------------------------------------------------------+
//| Get the type of representation of chart                          |
//+------------------------------------------------------------------+
ENUM_CHART_MODE CChart::Mode(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(WRONG_VALUE);
//--- result
//   return((ENUM_CHART_MODE)ChartGetInteger(m_chart_id,CHART_MODE));
//--- temporary
   return(WRONG_VALUE);
  }
//+------------------------------------------------------------------+
//| Set the type of representation chart                             |
//+------------------------------------------------------------------+
bool CChart::Mode(const ENUM_CHART_MODE mode) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_MODE,mode));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "Foreground" property                           |
//+------------------------------------------------------------------+
bool CChart::Foreground(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_FOREGROUND));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "Foreground" property                           |
//+------------------------------------------------------------------+
bool CChart::Foreground(const bool foreground) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_FOREGROUND,foreground));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "Shift" property                                |
//+------------------------------------------------------------------+
bool CChart::Shift(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHIFT));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "Shift"property                                 |
//+------------------------------------------------------------------+
bool CChart::Shift(const bool shift) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHIFT,shift));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShiftSize" property                            |
//+------------------------------------------------------------------+
double CChart::ShiftSize(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(DBL_MAX);
//--- result
//   return(ChartGetDouble(m_chart_id,CHART_SHIFT_SIZE));
//--- temporary
   return(EMPTY_VALUE);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShiftSize" property                            |
//+------------------------------------------------------------------+
bool CChart::ShiftSize(double shift) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
   if(shift<10)
      shift=10;
   if(shift>50)
      shift=50;
//--- result
//   return(ChartSetDouble(m_chart_id,CHART_SHIFT_SIZE,shift));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "AutoScroll" property                           |
//+------------------------------------------------------------------+
bool CChart::AutoScroll(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_AUTOSCROLL));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "AutoScroll" property                           |
//+------------------------------------------------------------------+
bool CChart::AutoScroll(const bool auto_scroll) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_AUTOSCROLL,auto_scroll));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "Scale" property                                |
//+------------------------------------------------------------------+
int CChart::Scale(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_SCALE));
//--- temporary
   return(0);
  }
//+------------------------------------------------------------------+
//| Set value of the "Scale" property                                |
//+------------------------------------------------------------------+
bool CChart::Scale(int shift) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
   if(shift<0)
      shift=0;
   if(shift>32)
      shift=32;
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SCALE,shift));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ScaleFix" property                             |
//+------------------------------------------------------------------+
bool CChart::ScaleFix(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SCALEFIX));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ScaleFix" property                             |
//+------------------------------------------------------------------+
bool CChart::ScaleFix(const bool scale_fix) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SCALEFIX,scale_fix));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ScaleFix_11" property                          |
//+------------------------------------------------------------------+
bool CChart::ScaleFix_11(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SCALEFIX_11));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ScaleFix_11" property                          |
//+------------------------------------------------------------------+
bool CChart::ScaleFix_11(const bool scale_fix_11) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SCALEFIX_11,scale_fix_11));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "FixedMax" property                             |
//+------------------------------------------------------------------+
double CChart::FixedMax(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(EMPTY_VALUE);
//--- result
//   return(ChartGetDouble(m_chart_id,CHART_FIXED_MAX));
//--- temporary
   return(EMPTY_VALUE);
  }
//+------------------------------------------------------------------+
//| Set value of the "FixedMax" property                             |
//+------------------------------------------------------------------+
bool CChart::FixedMax(const double fixed_max) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetDouble(m_chart_id,CHART_FIXED_MAX,fixed_max));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "FixedMin" property                             |
//+------------------------------------------------------------------+
double CChart::FixedMin(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(EMPTY_VALUE);
//--- result
//   return(ChartGetDouble(m_chart_id,CHART_FIXED_MIN));
//--- temporary
   return(EMPTY_VALUE);
  }
//+------------------------------------------------------------------+
//| Set value of the "FixedMin" property                             |
//+------------------------------------------------------------------+
bool CChart::FixedMin(const double fixed_min) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetDouble(m_chart_id,CHART_FIXED_MIN,fixed_min));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ScalePointsPerBar" property                    |
//+------------------------------------------------------------------+
bool CChart::ScalePPB(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SCALE_PT_PER_BAR));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ScalePointsPerBar" property                    |
//+------------------------------------------------------------------+
bool CChart::ScalePPB(const bool scale_ppb) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SCALE_PT_PER_BAR,scale_ppb));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "PointsPerBar" property                         |
//+------------------------------------------------------------------+
double CChart::PointsPerBar(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(EMPTY_VALUE);
//--- result
//   return(ChartGetDouble(m_chart_id,CHART_POINTS_PER_BAR));
//--- temporary
   return(EMPTY_VALUE);
  }
//+------------------------------------------------------------------+
//| Set value of the "PointsPerBar" property                         |
//+------------------------------------------------------------------+
bool CChart::PointsPerBar(const double points_per_bar) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetDouble(m_chart_id,CHART_POINTS_PER_BAR,points_per_bar));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowOHLC" property                             |
//+------------------------------------------------------------------+
bool CChart::ShowOHLC(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHOW_OHLC));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowOHLC" property                             |
//+------------------------------------------------------------------+
bool CChart::ShowOHLC(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_OHLC,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowLineBid" property                          |
//+------------------------------------------------------------------+
bool CChart::ShowLineBid(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHOW_BID_LINE));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowLineBid" property                          |
//+------------------------------------------------------------------+
bool CChart::ShowLineBid(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_BID_LINE,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowLineAsk" property                          |
//+------------------------------------------------------------------+
bool CChart::ShowLineAsk(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHOW_ASK_LINE));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowLineAsk" property                          |
//+------------------------------------------------------------------+
bool CChart::ShowLineAsk(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_ASK_LINE,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowLastLine" property                         |
//+------------------------------------------------------------------+
bool CChart::ShowLastLine(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHOW_LAST_LINE));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowLastLine" property                         |
//+------------------------------------------------------------------+
bool CChart::ShowLastLine(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_LAST_LINE,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowPeriodSep" property                        |
//+------------------------------------------------------------------+
bool CChart::ShowPeriodSep(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHOW_PERIOD_SEP));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowPeriodSep" property                        |
//+------------------------------------------------------------------+
bool CChart::ShowPeriodSep(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_PERIOD_SEP,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowGrid" property                             |
//+------------------------------------------------------------------+
bool CChart::ShowGrid(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHOW_GRID));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowGrid" property                             |
//+------------------------------------------------------------------+
bool CChart::ShowGrid(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_GRID,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowVolumes" property                          |
//+------------------------------------------------------------------+
ENUM_CHART_VOLUME_MODE CChart::ShowVolumes(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(WRONG_VALUE);
//--- result
//   return((ENUM_CHART_VOLUME_MODE)ChartGetInteger(m_chart_id,CHART_SHOW_VOLUMES));
//--- temporary
   return(WRONG_VALUE);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowVolumes" property                          |
//+------------------------------------------------------------------+
bool CChart::ShowVolumes(const ENUM_CHART_VOLUME_MODE show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_VOLUMES,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "ShowObjectDescr" property                      |
//+------------------------------------------------------------------+
bool CChart::ShowObjectDescr(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_SHOW_OBJECT_DESCR));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowObjectDescr" property                      |
//+------------------------------------------------------------------+
bool CChart::ShowObjectDescr(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_OBJECT_DESCR,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowDateScale" property                        |
//+------------------------------------------------------------------+
bool CChart::ShowDateScale(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_DATE_SCALE,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Set value of the "ShowPriceScale" property                       |
//+------------------------------------------------------------------+
bool CChart::ShowPriceScale(const bool show) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_SHOW_PRICE_SCALE,show));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Background" property                     |
//+------------------------------------------------------------------+
color CChart::ColorBackground(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_BACKGROUND));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Background" property                     |
//+------------------------------------------------------------------+
bool CChart::ColorBackground(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_BACKGROUND,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Foreground" property                     |
//+------------------------------------------------------------------+
color CChart::ColorForeground(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_FOREGROUND));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value for the "Foreground" property                    |
//+------------------------------------------------------------------+
bool CChart::ColorForeground(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_FOREGROUND,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Grid" property                           |
//+------------------------------------------------------------------+
color CChart::ColorGrid(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_GRID));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value for the "Grid" property                          |
//+------------------------------------------------------------------+
bool CChart::ColorGrid(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_GRID,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Bar Up" property                         |
//+------------------------------------------------------------------+
color CChart::ColorBarUp(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_CHART_UP));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Bar Up" property                         |
//+------------------------------------------------------------------+
bool CChart::ColorBarUp(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_CHART_UP,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Bar Down" property                       |
//+------------------------------------------------------------------+
color CChart::ColorBarDown(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_CHART_DOWN));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Bar Down" property                       |
//+------------------------------------------------------------------+
bool CChart::ColorBarDown(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_CHART_DOWN,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Candle Bull" property                    |
//+------------------------------------------------------------------+
color CChart::ColorCandleBull(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_CANDLE_BULL));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Candle Bull" property                    |
//+------------------------------------------------------------------+
bool CChart::ColorCandleBull(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_CANDLE_BULL,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Candle Bear" property                    |
//+------------------------------------------------------------------+
color CChart::ColorCandleBear(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_CANDLE_BEAR));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Candle Bear" property                    |
//+------------------------------------------------------------------+
bool CChart::ColorCandleBear(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_CANDLE_BEAR,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Chart Line" property                     |
//+------------------------------------------------------------------+
color CChart::ColorChartLine(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_CHART_LINE));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Chart Line" property                     |
//+------------------------------------------------------------------+
bool CChart::ColorChartLine(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_CHART_LINE,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Volumes" property                        |
//+------------------------------------------------------------------+
color CChart::ColorVolumes(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_VOLUME));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Volumes" property                        |
//+------------------------------------------------------------------+
bool CChart::ColorVolumes(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_VOLUME,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Line Bid" property                       |
//+------------------------------------------------------------------+
color CChart::ColorLineBid(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_BID));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Line Bid" property                       |
//+------------------------------------------------------------------+
bool CChart::ColorLineBid(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_BID,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Line Ask" property                       |
//+------------------------------------------------------------------+
color CChart::ColorLineAsk(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_ASK));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Line Ask" property                       |
//+------------------------------------------------------------------+
bool CChart::ColorLineAsk(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_ASK,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Line Last" property                      |
//+------------------------------------------------------------------+
color CChart::ColorLineLast(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_LAST));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Line Last" property                      |
//+------------------------------------------------------------------+
bool CChart::ColorLineLast(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_LAST,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get color value of the "Stop Levels" property                    |
//+------------------------------------------------------------------+
color CChart::ColorStopLevels(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(CLR_NONE);
//--- result
//   return((color)ChartGetInteger(m_chart_id,CHART_COLOR_STOP_LEVEL));
//--- temporary
   return(CLR_NONE);
  }
//+------------------------------------------------------------------+
//| Set color value of the "Stop Levels" property                    |
//+------------------------------------------------------------------+
bool CChart::ColorStopLevels(const color new_color) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_COLOR_STOP_LEVEL,new_color));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Shows chart always on top                                        |
//+------------------------------------------------------------------+
bool CChart::BringToTop(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_BRING_TO_TOP,true));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Sets flag to generate event of creating objects                  |
//+------------------------------------------------------------------+
bool CChart::EventObjectCreate(const bool flag) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_EVENT_OBJECT_CREATE,flag));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Sets flag to generate event of deleting objects                  |
//+------------------------------------------------------------------+
bool CChart::EventObjectDelete(const bool flag) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_EVENT_OBJECT_DELETE,flag));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Sets flag to generate event of moving mouse cursor               |
//+------------------------------------------------------------------+
bool CChart::EventMouseMove(const bool flag) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_EVENT_MOUSE_MOVE,flag));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Sets flag to mouse scrolling                                     |
//+------------------------------------------------------------------+
bool CChart::MouseScroll(const bool flag) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartSetInteger(m_chart_id,CHART_MOUSE_SCROLL,flag));
//--- temporary
   return(false);
  }
//+------------------------------------------------------------------+
//| Get value of the "VisibleBars" property                          |
//+------------------------------------------------------------------+
int CChart::VisibleBars(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_WIDTH_IN_BARS));
   return(WindowBarsPerChart());
  }
//+------------------------------------------------------------------+
//| Get value of the "WindowsTotal" property                         |
//+------------------------------------------------------------------+
int CChart::WindowsTotal(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_WINDOWS_TOTAL));
   return(WindowsTotal());
  }
//+------------------------------------------------------------------+
//| Get value of the "WindowIsVisible" property                      |
//+------------------------------------------------------------------+
bool CChart::WindowIsVisible(const int num) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(ChartGetInteger(m_chart_id,CHART_WINDOW_IS_VISIBLE,num));
   return(::WindowIsVisible(num));
  }
//+------------------------------------------------------------------+
//| Get value of the "WindowHandle" property                         |
//+------------------------------------------------------------------+
int CChart::WindowHandle(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(INVALID_HANDLE);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_WINDOW_HANDLE));
   return(::WindowHandle(Symbol(),Period()));
  }
//+------------------------------------------------------------------+
//| Get value of the "FirstVisibleBar" property                      |
//+------------------------------------------------------------------+
int CChart::FirstVisibleBar(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(-1);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_FIRST_VISIBLE_BAR));
   return(WindowFirstVisibleBar());
  }
//+------------------------------------------------------------------+
//| Get value of the "WidthInBars" property                          |
//+------------------------------------------------------------------+
int CChart::WidthInBars(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_WIDTH_IN_BARS));
   return(WindowBarsPerChart());    // ???
  }
//+------------------------------------------------------------------+
//| Get value of the "WidthInPixels" property                        |
//+------------------------------------------------------------------+
int CChart::WidthInPixels(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_WIDTH_IN_PIXELS));
//--- temporary
   return(0);
  }
//+------------------------------------------------------------------+
//| Get value of the "HeightInPixels" property                       |
//+------------------------------------------------------------------+
int CChart::HeightInPixels(const int num) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_HEIGHT_IN_PIXELS,num));
//--- temporary
   return(0);
  }
//+------------------------------------------------------------------+
//| Get value of the "WindowYDistance" property                      |
//+------------------------------------------------------------------+
int CChart::SubwindowY(const int num) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
//   return((int)ChartGetInteger(m_chart_id,CHART_WINDOW_YDISTANCE,num));
//--- temporary
   return(0);
  }
//+------------------------------------------------------------------+
//| Get value of the "PriceMin" property                             |
//+------------------------------------------------------------------+
double CChart::PriceMin(const int num) const
  {
//--- check
   if(m_chart_id==-1)
      return(EMPTY_VALUE);
//--- result
//   return(ChartGetDouble(m_chart_id,CHART_PRICE_MIN,num));
   return(WindowPriceMin(num));
  }
//+------------------------------------------------------------------+
//| Get value of the "PriceMax" property                             |
//+------------------------------------------------------------------+
double CChart::PriceMax(const int num) const
  {
//--- check
   if(m_chart_id==-1)
      return(EMPTY_VALUE);
//--- result
//   return(ChartGetDouble(m_chart_id,CHART_PRICE_MAX,num));
   return(WindowPriceMax(num));
  }
//+------------------------------------------------------------------+
//| Access function ChartScreenShot(...)                             |
//+------------------------------------------------------------------+
bool CChart::ScreenShot(const string filename,const int width,const int height,const ENUM_ALIGN_MODE align_mode) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
//   return(WindowScreenShot(m_chart_id,filename,width,height,align_mode));
   return(WindowScreenShot(filename,width,height));
  }
//+------------------------------------------------------------------+
//| Access function WindowOnDropped()                                |
//+------------------------------------------------------------------+
int CChart::WindowOnDropped(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
   return(::WindowOnDropped());
  }
//+------------------------------------------------------------------+
//| Access function PriceOnDropped()                                 |
//+------------------------------------------------------------------+
double CChart::PriceOnDropped(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(EMPTY_VALUE);
//--- result
   return(::PriceOnDropped());
  }
//+------------------------------------------------------------------+
//| Access function TimeOnDropped()                                  |
//+------------------------------------------------------------------+
datetime CChart::TimeOnDropped(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(false);
//--- result
   return(::TimeOnDropped());
  }
//+------------------------------------------------------------------+
//| Access functions XOnDropped()                                    |
//+------------------------------------------------------------------+
int CChart::XOnDropped(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
   return(WindowXOnDropped());
  }
//+------------------------------------------------------------------+
//| Access functions YOnDropped()                                    |
//+------------------------------------------------------------------+
int CChart::YOnDropped(void) const
  {
//--- check
   if(m_chart_id==-1)
      return(0);
//--- result
   return(WindowYOnDropped());
  }
//+------------------------------------------------------------------+
