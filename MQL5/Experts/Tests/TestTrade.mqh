class Account {};



class Trade {



  protected:



    struct TradeParams {

      uint     slippage;   // Value of the maximum price slippage in points.

      Account *account;    // Pointer to Account class.

    };



    TradeParams trade_params;



  public:



     void Trade(TradeParams &_params) {

       trade_params = _params; // Error: '=' - structure have objects and cannot be copied.

     }



};