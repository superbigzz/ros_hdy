#ifndef HDY_DRINK_SCRIPT_H
#define HDY_DRINK_SCRIPT_H
#include "action_manager.h"

class CDrinkScript : public CActionManager
{
public:
	CDrinkScript();
	~CDrinkScript();
    void Queue();
};

#endif // HDY_DRINK_SCRIPT_H