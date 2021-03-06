//+------------------------------------------------------------------+
//|                                                   InputCheck.mqh |
//|                                                   Abraão Moreira |
//|                                                abraaomoreira.com |
//+------------------------------------------------------------------+
#property copyright "Abraão Moreira"
#property link      "abraaomoreira.com"

class CInputCheck {
 public:
  //+------------------------------------------------------------------+
  //|  Volume check                                                    |
  //+------------------------------------------------------------------+
  bool CInputCheck :: VolumesOk(double volume) {
    double min_volume = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MIN);
    double max_volume = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_MAX);
    double volume_step = SymbolInfoDouble(_Symbol, SYMBOL_VOLUME_STEP);

    if(volume < min_volume) {
      MessageBox("Volume is less than the minimal to this symbol! \n" + "Minimal volume: " + (string)min_volume + "\n \n Please, try again with different value.");
      return false;
    }

    if(volume > max_volume) {
      MessageBox("Volume is greater than the maximal to this symbol! \n" + "Maximal volume: " + (string)max_volume + "\n \n Please, try again with different value.");
      return false;
    }
    int ratio = (int)MathRound(volume/volume_step);
    if(MathAbs(ratio*volume_step - volume) > 0.0000001) {
      MessageBox("Volume is not a multiple of the minimal step to this symbol!\n" + "Minimal step: " + (string)volume_step + "\n \n Please, try again with different value.");
      return false;
    }

    return true;
  }
};
//+------------------------------------------------------------------+
