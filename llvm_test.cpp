#ifndef LLVM_TEST_H
#define LLVM_TEST_H

#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/CFLSteensAliasAnalysis.h"
#include "llvm/Analysis/CFLAndersAliasAnalysis.h"
#include "llvm/Analysis/MemoryLocation.h"
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/Analysis/MemoryDependenceAnalysis.h"
#include "llvm/IR/GlobalAlias.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/CFG.h"

#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h" 
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/InstrTypes.h"

#include <vector>
#include <set>
#include <string.h>
#include <map>
#include <fstream>
#include <sstream>

namespace {
    using namespace llvm;

    class llvmTest : public ModulePass {
    public:
        static char ID;

        llvmTest() : ModulePass(ID) {
        }

        bool runOnModule(Module &M)
        {
            // do something with the module
            return false;
        }


        // Analysis Usage, specify PDG at this time
        void getAnalysisUsage(AnalysisUsage &AU) const {
            AU.setPreservesAll();
        }
    };

    char llvmTest::ID = 0;
    static RegisterPass<llvmTest> llvmTest("llvm-test", "LLVM TEST", false, true);
} // namespace
#endif
